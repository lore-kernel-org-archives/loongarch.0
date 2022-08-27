Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853BD15A9
	for <loongarch@lists.linux.dev>; Sat, 27 Aug 2022 13:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22023C433C1
	for <loongarch@lists.linux.dev>; Sat, 27 Aug 2022 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661606439;
	bh=hKEJAHcB/rJhF09vDlSJwQNMA44doH2+KJ3mvkEZjGY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LF72oNzEehDioAHCbCHWMbz+98dUYAiwMDs3m/b7IGrOooshPfuiZNIt9a/9qZ5/C
	 x2hnaybjjbHqaaV985ZKHlWu4rcRKBWsexp6bGkVqceKpaIkYoNnGfhFQeGu2O9gd/
	 fGh+k9YYyWGr1muJdtRx6QQriuGXOIJG7piH1Cy3nh4gjZd/Wg8F8vc31w8CORK/OB
	 Xe+rvmWlTztiRjI2It8+ZU8smCL9qaG+P+mt72Tmxi2An++6Il7ledjIRMSPEUV0nw
	 pUFOSatwuZmVwFIx4mtOuH3apzF/srsCmMxjpW+QWND570Xwm4Sv/eYstE2JbOj3Sr
	 06QToKffS4YfQ==
Received: by mail-vs1-f54.google.com with SMTP id 67so4152958vsv.2
        for <loongarch@lists.linux.dev>; Sat, 27 Aug 2022 06:20:39 -0700 (PDT)
X-Gm-Message-State: ACgBeo2DuUVYFRGds9sUhkhDp1QtsOTYxeS5Bfs1XadKUSbcN5FzXQWQ
	31JQAsczPoeuWUIBAHkmwOzEMKuhYhwT9NblmKE=
X-Google-Smtp-Source: AA6agR5q7+12h6e09sqNBSAACL052gRHPjL0BUKXwL6RjPJXLGoDTAmMNUPLtpm+Quu01xWj9NLbCtRcfQULhBS3Elg=
X-Received: by 2002:a05:6102:3a70:b0:390:81fc:3f39 with SMTP id
 bf16-20020a0561023a7000b0039081fc3f39mr1278991vsb.84.1661606438058; Sat, 27
 Aug 2022 06:20:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <32a74a218c76611f897fd1df1ad0059068621133.camel@xry111.site>
 <ec52fd49-4a30-15d9-3d32-fd7bc6d8b3f0@loongson.cn> <0179679b736aea7258981dec2d83107cce74dfc1.camel@xry111.site>
 <a139a8475fe295ac9f17064269cd0312dca6f96e.camel@xry111.site>
 <6b5d2188f93ed72b67a4bbb7116113f833fe1ee5.camel@xry111.site>
 <d7670b60-2782-4642-995b-7baa01779a66@loongson.cn> <7cad6e78014168a8906e130e1cf3809077d2bda7.camel@xry111.site>
 <1d0783b87bda3e454a111862fcc5b5faffcb16b0.camel@xry111.site>
 <00eede4b1380888a500f74b1e818bb25a550632b.camel@xry111.site>
 <7512ae16-b171-d072-674f-a6b9a5e764d6@loongson.cn> <CAAhV-H5wSJZ2X46ySqoaJd7Z2soGcYKRNixnghmE3f3zEzyS+w@mail.gmail.com>
 <10751c9af5d45fea741e0bbed6c818ddb9db3ac3.camel@xry111.site>
 <7b1f9813-85fc-acfd-8e24-7e01469ded3a@loongson.cn> <ba5e99de-0719-af88-4d94-8860787a4251@loongson.cn>
 <d6cab26afc5829c1b93bc1cc5867ebf22f5c7f47.camel@xry111.site>
 <3c724516-50eb-cd34-5e4f-399c53a89ee4@loongson.cn> <98efbf76-fbf3-f90b-82d4-bd2874088d05@loongson.cn>
 <8fd0864c3f7f3ca53db4c663215f757993ee1596.camel@xry111.site>
In-Reply-To: <8fd0864c3f7f3ca53db4c663215f757993ee1596.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 27 Aug 2022 21:20:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H57rrOmuYTU5xqYMehb7rFsnX+ggRicNryBf13i9=xXkQ@mail.gmail.com>
Message-ID: <CAAhV-H57rrOmuYTU5xqYMehb7rFsnX+ggRicNryBf13i9=xXkQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] LoongArch: Support new relocation types
To: Xi Ruoyao <xry111@xry111.site>, Arnd Bergmann <arnd@arndb.de>
Cc: Lulu Cheng <chenglulu@loongson.cn>, Youling Tang <tangyouling@loongson.cn>, 
	Jinyang He <hejinyang@loongson.cn>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"

Hi, Arnd,

Could you please update the cross-compilers here [1]  with the current
snapshot of binutils and gcc? Or we can only do that until new
binutils/gcc be released?

New relocation types will be supported in binutils-2.40 and gcc-13 but
they will be released after kernel-6.1.  If possible, we want to make
this series be upstream in the 6.1 cycle and remove the old relocation
types support at the same time (This means we cannot use old toolchain
to build new kernels). Since 5.19 and 6.0 are un-bootable on
LoongArch, this will break nothing but make life easier by reducing
maintenance cost.

[1] https://mirrors.edge.kernel.org/pub/tools/crosstool/


Huacai

On Tue, Aug 2, 2022 at 3:15 PM Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Tue, 2022-08-02 at 14:39 +0800, Lulu Cheng wrote:
>
> > >
> > >  OO, old toolchains require extra handlingg no matter how modified.
> > >  Maybe rejecting old toolchain builds is a good option as Huacai
> > > said.
>
> > Sorry to ask, is it possible to use an absolute address to visit here?
> > Like precpu, do not use pcrel or got, and it directly uses
> > four instructions to obtain the absolute address.
> > The same is achieved by adding attributes in GCC.
>
> Both GOT and ABS will work.  But to me GOT is better because it only
> needs two instructions while ABS needs four.
>
> The most troubling issue is how to support the old GCC.  It seems we
> have to check GCC version and use -Wa,-mla-local-with-pcrel for GCC 12
> (while I still think GOT is better but we don't have -mla-local-with-
> got, *and* it will cause make every local object address load cost 4
> instructions), or we just say "it's impossible to use GCC 12 to build
> Linux 6.0 for LoongArch".
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
