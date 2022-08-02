Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14AC7F
	for <loongarch@lists.linux.dev>; Tue,  2 Aug 2022 01:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFA6C43470
	for <loongarch@lists.linux.dev>; Tue,  2 Aug 2022 01:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659405236;
	bh=Ji1d5P2JFD8eg6AjTCjdkhd67npMDhGaNZy8jS/PYWs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gskRq/ApykGFhpi+aCpK1RpLyHxAoYS2j0Yo+KT9ey0J+pirEg+c6FuXtfGTuqljl
	 wcWzBrKbpgY1VSQUgfB7zlpi+T1EVrjjLY1t77QQNG8jdyPUe+bj/AnokdFTIxZ2hM
	 +mRgEH5W7sq4q942RF4ovmfbhARPyiB5mUgxg81BCc87ToRTxBQcQl3Ds+JHXP5OK2
	 /ZhDJlWOJkKJX/lvoREiIWDY2qyzhE6rzp2iHA7yoMzFulFNXw5ML4rBB+NEpzID6x
	 LcwRUI7rtDm0vX1cjdbcbZU1/qMOvOCV3MG6yH9TinIVIjSMSencA7bBc5lV0VuxFf
	 gD+5AUotDNOeQ==
Received: by mail-ua1-f43.google.com with SMTP id s7so5282520uao.4
        for <loongarch@lists.linux.dev>; Mon, 01 Aug 2022 18:53:56 -0700 (PDT)
X-Gm-Message-State: ACgBeo1Eb3n+ONQauls8kPaNPGykoZ0tuW9RTnq/IW2vTVpUSaOgoZnm
	yG6T23GVi7P1sB1rDmMFIL5R/ZjU6KnblHIzgTc=
X-Google-Smtp-Source: AA6agR4vJQuLtNDbVrQJwjfOvM3OFTgchZN191QtiHRsJvs8AYpMmeqJAEAOGnsFwfJyVQJZZ1k30J23ljMln5UrBMI=
X-Received: by 2002:ab0:6798:0:b0:382:d9f4:8d0 with SMTP id
 v24-20020ab06798000000b00382d9f408d0mr7215680uar.63.1659405235487; Mon, 01
 Aug 2022 18:53:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220801121726.9681-1-zhangqing@loongson.cn> <20220801121726.9681-3-zhangqing@loongson.cn>
 <CAAhV-H4hR-Xdk5EpakR9ft0J+V5qgPj5q2T=zjh1SHMnnHK1vw@mail.gmail.com>
 <6e6a7219-8666-bd9e-770a-e60e4b329832@loongson.cn> <CAAhV-H7yfxX-ZsXjvWvSTwsyc8jf34jEOeLJ+dJ6jktJzuiryA@mail.gmail.com>
 <1afd44fab8dacdda7927b6e699bf74c8a1cad773.camel@xry111.site>
In-Reply-To: <1afd44fab8dacdda7927b6e699bf74c8a1cad773.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 2 Aug 2022 09:53:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5s_x13ws+Mt=6VfXPdXJ8wp82c8HS2hJ_ND7qKL6_V5g@mail.gmail.com>
Message-ID: <CAAhV-H5s_x13ws+Mt=6VfXPdXJ8wp82c8HS2hJ_ND7qKL6_V5g@mail.gmail.com>
Subject: Re: [PATCH 2/4] LoongArch: Add prologue unwinder support
To: Xi Ruoyao <xry111@xry111.site>
Cc: Youling Tang <tangyouling@loongson.cn>, Qing Zhang <zhangqing@loongson.cn>, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Jinyang He <hejinyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Ruoyao,

On Tue, Aug 2, 2022 at 9:39 AM Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Tue, 2022-08-02 at 09:34 +0800, Huacai Chen wrote:
> > > > #define UNWINDER_GUESS     0
> > > > #define UNWINDER_PROLOGURE 1
> > >
> > > Maybe it's better to define with enum type?
> > > enum unwind_type {
> > >          UNWINDER_GUESS,
> > >          UNWINDER_PROLOGURE,
> > > };
> > Both macro and enum are acceptable, but enum is essentially "int",
> > while the "type" member is "char" here.
>
> "0" or "1" will also be "int" (C99 6.4.4.1 para 5).
OK, then Zhang Qing has her rights to choose. :)

Huacai
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
