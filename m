Received: from mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877C5179A8
	for <loongarch@lists.linux.dev>; Sat,  7 Oct 2023 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mailo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailo.com header.i=@mailo.com header.b="Wl/YS/3c"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1696683633; bh=6e/J14qgrz5/5aSBCNVxqNF6zVd6jEJWQXAXSY4IkQs=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
	b=Wl/YS/3c1/JXS9cetGFFrgwJM4to1+2/hZSU41yumdXep8sVGnd2NwUKQqvfJL1Es
	 ERE2lEUgaUMAO9iQ3VwKlYKrK9L+VG+4watCndLoHV9j8lcnLVBFSOtUe40Avp+D6s
	 DMOwvjnWgnzDTU7r2mBBXGgtdD+3cbLwBMgNB3Ps=
Received: by b221-4.in.mailobj.net [192.168.90.24] with ESMTP
	via ip-20.mailobj.net [213.182.54.20]
	Sat,  7 Oct 2023 15:00:33 +0200 (CEST)
X-EA-Auth: CAve3YZ/hZSuwfASOt92PtmM7Xx8xFaK9CD6lQ30TkqPKvGUURv8G1rIc+WBPmvrICkK34P+vUG14I6ddiREXgxjMkykTT5H
Date: Sat, 7 Oct 2023 18:30:27 +0530
From: Deepak R Varma <drv@mailo.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: kmap() transformation: Question about copy_user_highpage
Message-ID: <ZSFWa44FTi48hDyE@runicha.com>
References: <ZSBV+h/gjPWV7+Gj@runicha.com>
 <CAAhV-H7B2tqw-PWD2775Nx1JiPVwh8nGYsVDTiA0QjBhTYbrMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H7B2tqw-PWD2775Nx1JiPVwh8nGYsVDTiA0QjBhTYbrMw@mail.gmail.com>

On Sat, Oct 07, 2023 at 12:55:14PM +0800, Huacai Chen wrote:
> Hi, Deepak,

Hello Huacai,

>
> On Sat, Oct 7, 2023 at 2:46 AM Deepak R Varma <drv@mailo.com> wrote:
> >
> > Hello,
> > I am attempting to work on replacing the kmap[_atomic]() calls by
> > kmap_local_page() function call. A detail on this change can be found here [0].
> >
> > I would like to know if this function:
> >         arch/loongarch/mm/init.c::copy_user_highpage()
> > is currently in use or is it a dead code?
> >
> > If this code is not in use, can this be removed instead? However, if it is in
> > use, can you comment why kmap_atomic() was preferred over kmap()
> > function call?
> I think this function will be used for the 32bit kernel, and we will
> add loongarch32 support in the near future.

Okay. Sounds good.

>
> But on the other hand, you can replace kmap_atomic() with
> kmap_local_page(), there is no special reason to use kmap_atomic().

Looks like you sent in a patch. Thank you. I was working on trying to cross
compile my patch for the arch. I still would like to attempt that. Will request
your help if I get stuck.

regards,
deepak.


>
> Huacai
>
> >
> > [0] https://lore.kernel.org/all/20201029222652.302358281@linutronix.de/
> >
> > Thank you,
> > Deepak.
> >
> >
> >


