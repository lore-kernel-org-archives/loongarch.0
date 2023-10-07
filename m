Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E178B39D
	for <loongarch@lists.linux.dev>; Sat,  7 Oct 2023 04:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWxpdLb6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D117C433C7
	for <loongarch@lists.linux.dev>; Sat,  7 Oct 2023 04:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696654530;
	bh=2a1Ky/mZH2hKASG6nu8YJuKy2KoxgXfikcJ2YLB+iBs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HWxpdLb6+PBUeZMZRWmrE2lLvuut56PjpJirWspEJBkC+ZIw2a7qoAP8AOTcKZU5o
	 HuezpFW3JK0UdOnmarLvMGsFK2dW5mS2ZL4XA9yOfHmCg0DOrwbiT2GWm+/RsvCXSO
	 bDL1xLXZ60k1M2is1wKUSrpXS0b/AdJt+jDyf59uefpYeWRqpYSXQ7nFsbdWuHAJZM
	 0qUI7MJ4lNiTXksGjFJaS71HW8g1PjQxRWgu2SHqoF0Xh8Kkm7fDPFDOQqhBB92BoT
	 z460AEbnEQcXpMyPUdHaNU630YixVsXVNQCSWi4etTrxCFuKoq6m2zIyOv+R4NASNu
	 6UqJ6n8IXL84A==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-53447d0241eso5154137a12.3
        for <loongarch@lists.linux.dev>; Fri, 06 Oct 2023 21:55:30 -0700 (PDT)
X-Gm-Message-State: AOJu0YxQpi51s2DuAJBCIp4VvFoLehc36MS5+MvZIun7j4+zhUv1jf5m
	KsjQfPkgbfSJjctn8aq3O33yOBhkTTKqlJsiCqU=
X-Google-Smtp-Source: AGHT+IE7mApsDZ+8ZOec5Q0y0hZbCMPUj8bHzBPX9M+6tqJovbWwXy7Bf3VA2vF1fogBKgVbx+7saaTi9FpmUB023Wk=
X-Received: by 2002:a05:6402:7d6:b0:523:1fa2:4f40 with SMTP id
 u22-20020a05640207d600b005231fa24f40mr8763067edy.19.1696654528679; Fri, 06
 Oct 2023 21:55:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZSBV+h/gjPWV7+Gj@runicha.com>
In-Reply-To: <ZSBV+h/gjPWV7+Gj@runicha.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 7 Oct 2023 12:55:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7B2tqw-PWD2775Nx1JiPVwh8nGYsVDTiA0QjBhTYbrMw@mail.gmail.com>
Message-ID: <CAAhV-H7B2tqw-PWD2775Nx1JiPVwh8nGYsVDTiA0QjBhTYbrMw@mail.gmail.com>
Subject: Re: kmap() transformation: Question about copy_user_highpage
To: Deepak R Varma <drv@mailo.com>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Deepak,

On Sat, Oct 7, 2023 at 2:46=E2=80=AFAM Deepak R Varma <drv@mailo.com> wrote=
:
>
> Hello,
> I am attempting to work on replacing the kmap[_atomic]() calls by
> kmap_local_page() function call. A detail on this change can be found her=
e [0].
>
> I would like to know if this function:
>         arch/loongarch/mm/init.c::copy_user_highpage()
> is currently in use or is it a dead code?
>
> If this code is not in use, can this be removed instead? However, if it i=
s in
> use, can you comment why kmap_atomic() was preferred over kmap()
> function call?
I think this function will be used for the 32bit kernel, and we will
add loongarch32 support in the near future.

But on the other hand, you can replace kmap_atomic() with
kmap_local_page(), there is no special reason to use kmap_atomic().

Huacai

>
> [0] https://lore.kernel.org/all/20201029222652.302358281@linutronix.de/
>
> Thank you,
> Deepak.
>
>
>
