
#import "YNewsViewController.h"
#import "YNewsCell.h"
#import "YNewsWebViewController.h"
#import "News.h"
#import "YNewsClient.h"
#import "AFJSONRequestOperation.h"
#import "ReadabilityActivity.h"
#import "SVProgressHUD.h"
#import "SVPullToRefresh.h"

#import "AFNetworkActivityIndicatorManager.h"

@interface YNewsViewController ()

@end

@implementation YNewsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadNews];
    
   // __weak YNewsViewController  *weekSelf = self;
    
    [self.tableView addPullToRefreshWithActionHandler:^{
        // prepend data to dataSource, insert cells at top of table view
        // call [tableView.pullToRefreshView stopAnimating] when done
        
        //__strong YNewsViewController  *strongSelf = weekSelf;
        
        [self loadNews];
        [self.tableView.pullToRefreshView stopAnimating];
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [_weGotThis count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YNewsCell *cell = (YNewsCell *)[tableView dequeueReusableCellWithIdentifier:@"newsCell"];
    
    
    News *news = [self.weGotThis objectAtIndex:indexPath.row];

    if ([news.autor respondsToSelector:@selector(isEqualToString:)]) {
               
        cell.titleLable.text = news.title;
        cell.autorLable.text = news.autor;
        cell.time.text = news.time;
        return cell;

    }
    
    else { 
        cell.titleLable.text = @"Something went wrong here";
        return cell;
 
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
    
     */
    
     News *news = [self.weGotThis objectAtIndex:indexPath.row];
    
    NSURL *url = [NSURL URLWithString:news.url];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    YNewsWebViewController *webView = [[YNewsWebViewController alloc]initWithRequestURL:request];
    
    [self.navigationController pushViewController:webView animated:YES];
    
    
    // init Readability activity

    
//    ReadabilityActivity *rdb = [[ReadabilityActivity alloc] init];
//    
//    // set up activity item / action. url is a NSURL
//    NSArray *activityItems = @[ReadabilityActivityAdd, url];
//    
//    // init share sheet with app-specific activity
//    UIActivityViewController *shareSheet = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:@[rdb]];
//    
//    // present the view controller, animated.
//    [self presentViewController:shareSheet
//                       animated:YES
//                     completion:^{
//                     }];

    
}

#pragma mark -Network methods

-(void)loadNews {
    
   // [SVProgressHUD show];

    NSURL *url = [NSURL URLWithString:@"http://node-hnapi.herokuapp.com/news"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        _weGotThis = [[NSMutableArray alloc]init];
        for (id stuff in JSON) {
            News *news = [[News alloc]initWithDictionary:stuff];
            [_weGotThis addObject:news];
            // NSLog(@"%@",JSON);
        }
        
        _results = _weGotThis;
        
      //  [SVProgressHUD dismiss];
        [self.tableView reloadData];
        
    }failure:nil];
    
    [operation start];

}

@end
