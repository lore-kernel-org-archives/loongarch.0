Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B64F7E
	for <loongarch@lists.linux.dev>; Mon, 13 Feb 2023 01:06:52 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id u27so12940881ljo.12
        for <loongarch@lists.linux.dev>; Sun, 12 Feb 2023 17:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H0tOTl0q9G0IbiCA8ynYG2VbbtfPCnSoMkBJxv+VPkk=;
        b=p3p2+yunSP8zag+A7hM/kfSUJ/nuLfcHj3C8enkMjTrcEkQa8I+P30KMtdIFGcCrNo
         N0J00ZnsL7ZlkXDPPsYaVZ4yyNE2KIYZTcJMtoTWIRdv0wwBLJ5ZwvGSV6GHRUvFmTDE
         L2s+/QaxWKHYytRh/zl8+RZhiZzh6JjD5u+R1DR+4M0ygpmzc9wgFoCvWYeMaUfC/jpG
         NhTYtvIG6jiKG1AkRIkCV7o+ADzT6rKGNPFPhxJ3lIj1QoCk90XNj/AhOqDLiXM6xTOV
         4yr2UvHSbc3ypeAexc3TxFo4hQaqWmk3iULCk6yKlIbPVJR77tWdS/QLbUUEIA6qB/nB
         Kt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0tOTl0q9G0IbiCA8ynYG2VbbtfPCnSoMkBJxv+VPkk=;
        b=v54tbCfnjE1mh7lzKVST04yv17BQYmaUvxPTDLYaqEk3Ce1xPkBPgWG6Vi4yvnop5Z
         FXywb1w31ypTjEy1R1MRwl4ABb7xqunqK1cfs5s2n2ckyy+fliHIWSqMIT4WgJ9hT2sL
         0HCTsfj+UYCdbtQPO+4jVCSG9+pLI8sXvtPWxr6LDFzAdQWl3PFIriFe04m2Nbf4rJsz
         iCKwktPWgHkyLwJoRxYUMpp9G1wo3ejYKjSJBeAmhaDYu9QV2hbucU/xYuKhkRObnS+r
         OLwGGF6o9fGd3gz4xFjZSjuhy+TuNxyscdUrnsm1KvNiJXDySSQa8QKKMHM7ext4cdgK
         FrPA==
X-Gm-Message-State: AO0yUKW6UXHfypbG3kz5lY1+PzJsrb1v5F/ACPhqJBOUbTAeraRuSYaQ
	iWCHL5p8DciFo6cNIg4+c1QIR3Ejxi1KjA8h3Go=
X-Google-Smtp-Source: AK7set8XpcGjgfMefDDmmIZk31WrVPckHl8M/dQUPlwxVExbl3UjUkOEDjEYckTydZ8xIhxrGgA4G3OZeMgWRkXjBlA=
X-Received: by 2002:a2e:8457:0:b0:293:5147:d811 with SMTP id
 u23-20020a2e8457000000b002935147d811mr50919ljh.132.1676250410037; Sun, 12 Feb
 2023 17:06:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1675907639.git.chenfeiyang@loongson.cn> <f60027664200d6d1f0ed6c7b87915a223afb982f.1675907639.git.chenfeiyang@loongson.cn>
 <Y+lWQC3XU3xWqEi2@1wt.eu>
In-Reply-To: <Y+lWQC3XU3xWqEi2@1wt.eu>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Mon, 13 Feb 2023 09:06:36 +0800
Message-ID: <CACWXhK=FKV=CppZnHtO3x33GhJgMQ8gmcgxp_Hn-bo7YcxRrnQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] tools/nolibc: Add statx() and make stat() rely on
 statx() if necessary
To: Willy Tarreau <w@1wt.eu>
Cc: paulmck@kernel.org, Feiyang Chen <chenfeiyang@loongson.cn>, arnd@arndb.de, 
	chenhuacai@kernel.org, jiaxun.yang@flygoat.com, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Vincent Dagonneau <v@vda.io>
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Feb 2023 at 05:12, Willy Tarreau <w@1wt.eu> wrote:
>
> Hi Feiyang,
>
> On Thu, Feb 09, 2023 at 11:24:13AM +0800, chris.chenfeiyang@gmail.com wrote:
> > From: Feiyang Chen <chenfeiyang@loongson.cn>
> >
> > LoongArch and RISC-V 32-bit only have statx(). ARC, Hexagon, Nios2 and
> > OpenRISC have statx() and stat64() but not stat() or newstat(). Add
> > statx() and make stat() rely on statx() if necessary to make them happy.
> > We may just use statx() for all architectures in the future.
> >
> > Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
> > ---
> >  tools/include/nolibc/sys.h | 56 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >
> > diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> > index c4818a9c8823..70c30d457952 100644
> > --- a/tools/include/nolibc/sys.h
> > +++ b/tools/include/nolibc/sys.h
> > @@ -20,6 +20,7 @@
> >  #include <linux/time.h>
> >  #include <linux/auxvec.h>
> >  #include <linux/fcntl.h> // for O_* and AT_*
> > +#include <linux/stat.h>  // for statx()
>
> This one causes build warnings on all archs but x86_64:
>
>   /f/tc/nolibc/gcc-11.3.0-nolibc/aarch64-linux/bin/aarch64-linux-gcc -Os -fno-ident -fno-asynchronous-unwind-tables  -s -o nolibc-test \
>     -nostdlib -static -Isysroot/arm64/include nolibc-test.c -lgcc
>   In file included from sysroot/arm64/include/sys.h:23,
>                    from sysroot/arm64/include/nolibc.h:99,
>                    from sysroot/arm64/include/errno.h:26,
>                    from sysroot/arm64/include/stdio.h:14,
>                    from nolibc-test.c:15:
>   sysroot/arm64/include/linux/stat.h:9: warning: "S_IFMT" redefined
>       9 | #define S_IFMT  00170000
>         |
>   In file included from sysroot/arm64/include/nolibc.h:98,
>                    from sysroot/arm64/include/errno.h:26,
>                    from sysroot/arm64/include/stdio.h:14,
>                    from nolibc-test.c:15:
>   sysroot/arm64/include/types.h:27: note: this is the location of the previous definition
>
> This is caused by the definitions for S_IF* and S_IS* in types.h. However
> if I remove them I'm seeing x86_64 fail on S_IFCHR not defined. The root
> cause is that the x86_64 toolchain falls back to /usr/include for the
> include_next <limits.h> that others do not do (probably that when built
> it thought it was a native compiler instead of a cross-compiler). I'm
> apparently able to work around this by ifdefing out the definitions but
> it makes me feel like I'm hiding the dust under the carpet. Instead I'm
> thinking of reusing Vincent's work who added stdint and the definitions
> for the various INT*MAX values that are normally found in limits.h and
> providing our own limits.h so that this issue is globally addressed.
>
> I'm going to experiment a little bit about this and will propose something
> once I'm satisfied with a solution that we can queue for 6.4. Most likely
> it will involve merging a variant of Vincent's series first, a few changes
> to have limits.h then your series.
>

Hi, Willy,

OK. Thank you very much!

Thanks,
Feiyang

> Best regards,
> Willy
