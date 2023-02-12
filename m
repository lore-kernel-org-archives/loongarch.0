Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5917E5
	for <loongarch@lists.linux.dev>; Sun, 12 Feb 2023 21:12:59 +0000 (UTC)
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 31CLCWem005521;
	Sun, 12 Feb 2023 22:12:32 +0100
Date: Sun, 12 Feb 2023 22:12:32 +0100
From: Willy Tarreau <w@1wt.eu>
To: chris.chenfeiyang@gmail.com
Cc: paulmck@kernel.org, Feiyang Chen <chenfeiyang@loongson.cn>, arnd@arndb.de,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
        Vincent Dagonneau <v@vda.io>
Subject: Re: [PATCH v3 2/5] tools/nolibc: Add statx() and make stat() rely on
 statx() if necessary
Message-ID: <Y+lWQC3XU3xWqEi2@1wt.eu>
References: <cover.1675907639.git.chenfeiyang@loongson.cn>
 <f60027664200d6d1f0ed6c7b87915a223afb982f.1675907639.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f60027664200d6d1f0ed6c7b87915a223afb982f.1675907639.git.chenfeiyang@loongson.cn>

Hi Feiyang,

On Thu, Feb 09, 2023 at 11:24:13AM +0800, chris.chenfeiyang@gmail.com wrote:
> From: Feiyang Chen <chenfeiyang@loongson.cn>
> 
> LoongArch and RISC-V 32-bit only have statx(). ARC, Hexagon, Nios2 and
> OpenRISC have statx() and stat64() but not stat() or newstat(). Add
> statx() and make stat() rely on statx() if necessary to make them happy.
> We may just use statx() for all architectures in the future.
> 
> Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
> ---
>  tools/include/nolibc/sys.h | 56 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> index c4818a9c8823..70c30d457952 100644
> --- a/tools/include/nolibc/sys.h
> +++ b/tools/include/nolibc/sys.h
> @@ -20,6 +20,7 @@
>  #include <linux/time.h>
>  #include <linux/auxvec.h>
>  #include <linux/fcntl.h> // for O_* and AT_*
> +#include <linux/stat.h>  // for statx()

This one causes build warnings on all archs but x86_64:

  /f/tc/nolibc/gcc-11.3.0-nolibc/aarch64-linux/bin/aarch64-linux-gcc -Os -fno-ident -fno-asynchronous-unwind-tables  -s -o nolibc-test \
    -nostdlib -static -Isysroot/arm64/include nolibc-test.c -lgcc
  In file included from sysroot/arm64/include/sys.h:23,
                   from sysroot/arm64/include/nolibc.h:99,
                   from sysroot/arm64/include/errno.h:26,
                   from sysroot/arm64/include/stdio.h:14,
                   from nolibc-test.c:15:
  sysroot/arm64/include/linux/stat.h:9: warning: "S_IFMT" redefined
      9 | #define S_IFMT  00170000
        | 
  In file included from sysroot/arm64/include/nolibc.h:98,
                   from sysroot/arm64/include/errno.h:26,
                   from sysroot/arm64/include/stdio.h:14,
                   from nolibc-test.c:15:
  sysroot/arm64/include/types.h:27: note: this is the location of the previous definition

This is caused by the definitions for S_IF* and S_IS* in types.h. However
if I remove them I'm seeing x86_64 fail on S_IFCHR not defined. The root
cause is that the x86_64 toolchain falls back to /usr/include for the
include_next <limits.h> that others do not do (probably that when built
it thought it was a native compiler instead of a cross-compiler). I'm
apparently able to work around this by ifdefing out the definitions but
it makes me feel like I'm hiding the dust under the carpet. Instead I'm
thinking of reusing Vincent's work who added stdint and the definitions
for the various INT*MAX values that are normally found in limits.h and
providing our own limits.h so that this issue is globally addressed.

I'm going to experiment a little bit about this and will propose something
once I'm satisfied with a solution that we can queue for 6.4. Most likely
it will involve merging a variant of Vincent's series first, a few changes
to have limits.h then your series.

Best regards,
Willy
