Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D789C194AC7;
	Mon, 17 Jun 2024 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718629906; cv=none; b=uLHdFnGUsz5IuUWfAM4tESzQS8T73HkMdex+H8N/NZa/QOsmmD/8q1fTObzdr6LEbIq2DLyWdG6SqtIlvyfSy/IynJG9PtmPoVNBu5GOR7AVaTWjrWOMbqwhKzUXCJsA50IezLL5nkBKFiQUs/E+e3zWJOzEMGKAWln/tfBgU9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718629906; c=relaxed/simple;
	bh=vk8ltgfrOhK1pCbCVL3rA9Zy2WCAbA3ea5wO8nSlo/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CI9rUYaIvGY+oP9Kdcd5JLSX9VEt6kbh3NsyjqeQmG8vWy7xuwxUMru1zYA1hLrofjHxOm+Q38ADLfjDZa/ASJ/YBqUurcv5jOG7+B+bot01p13npmo7GboegUFMDQsd5ubaSoeQOwTLxKht6LHQcDTvAkTCYvhe7ECcw1Gmld8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gw1EGtxi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gw1EGtxi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B022C4AF55;
	Mon, 17 Jun 2024 13:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718629905;
	bh=vk8ltgfrOhK1pCbCVL3rA9Zy2WCAbA3ea5wO8nSlo/0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Gw1EGtxilfH0P6Hje5XOUMthaK47vwNmpSwoNWUfuSRjT/nn174H8Flz0fPxK5V8b
	 Msu+fX7rNkirEMe72s1HImo8J0+70gpyupOgHAmZo1ZCqFXWOROXELLFLoDDTCEFTA
	 dX0xDVVG/+5y/5GQHms0voGtWna+7hZhkIkcCNCFmqu56pDkZRQdip1dCMQnbmG4Np
	 IIyQwfyaznrB2sb1FVC02o+XOqlKkHzIyw5CNTVrj7N6NIBBFdPY6RKmPIJ92V+PLZ
	 YyheSx8wO41x8dI4ScgCCVqVTxAU75KfJaxeO/RsUFyt3PXfMSVMwpCrst5phC4ZaO
	 PhGqPFEfAgqMg==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6f7720e6e8so153790366b.3;
        Mon, 17 Jun 2024 06:11:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhKbU8wdAxClmUIGco58dUgbLFsvXvHdPoinRreph0g7kA4laxQNGhMDRMAScPc3TrSOTICLUoqQuov/sgSy8PJvPmr3JD6BUmR1tO/aXzPgK1ALZYYDLNEVCela28iw==
X-Gm-Message-State: AOJu0Yys9yJ2sTEH06SeXP7cMDCCSWqyM7CVz4TNgTT5ST1PQtr4r1XU
	TkxZS7KgaBm4KFZUojC23z3faaR3r7rDmvKOJKfG+mnDlcREIG+efYEB4pQ/gPUpvQLss2r1kZb
	myAFiDsoqPYv7z0Z0ya9sGDwLQBM=
X-Google-Smtp-Source: AGHT+IHcuRPRYJ1n13ufoO+LIkvk/Kyxa5KZKfGqTZ7cf/Yj5SrxFwd4pU8KZbp/Nqi2iqgvT8ZQoc8IcRdDCJ3pp0k=
X-Received: by 2002:a17:906:398d:b0:a6f:4d6b:c77a with SMTP id
 a640c23a62f3a-a6f60d13b99mr808989666b.13.1718629904025; Mon, 17 Jun 2024
 06:11:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240604150741.30252-1-xry111@xry111.site> <20240605054328.GA279426@thelio-3990X>
 <b55b8cb2c52f2c3701c83353586130b8dc237ee2.camel@xry111.site>
 <20240605062548.GF279426@thelio-3990X> <f8ef61773b0119b8573fc0fed9ad0a8b43061efd.camel@xry111.site>
 <444ec2031ef6ca016cbfa8dfedc51bddc8529ba7.camel@xry111.site>
 <ada035690e446909c3cdbf9a43a92def96020615.camel@xry111.site>
 <82b7e6ea-c2cb-6364-ebe9-bff928028408@loongson.cn> <1c132209a612e2e8953f0b458fc01853120db9a9.camel@xry111.site>
 <2bf11cd2-8449-acda-f5ad-659c38cb018e@loongson.cn> <96a2e8a80c06772b64fcbdba42e1dae2d68a53a7.camel@xry111.site>
 <2bd6ae20-ec56-c1a2-c5dd-e8c978a376d3@loongson.cn> <329dac82e09dfc75e77ae93ebbeacdec1dc9ff7f.camel@xry111.site>
 <CAAhV-H5Wz=U4kbX+tXt1qoCr6RaEDkzZXV7B=tgU_8o+X-NtVQ@mail.gmail.com>
 <a97cd0f2e2cac10253d6b5cdd0ace3db3b220535.camel@xry111.site>
 <CAAhV-H7hhh3Jes0jMrg82+KJCa7GQZW=F9bDtktFh=eazMDX9w@mail.gmail.com> <12099e6fb7ba377f3dcf6686e0b37200b9818708.camel@xry111.site>
In-Reply-To: <12099e6fb7ba377f3dcf6686e0b37200b9818708.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 17 Jun 2024 21:11:33 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6j0WgN6QpHBYcdprdWBpcQq4ObYK5YcE=TVsDNxGFEtA@mail.gmail.com>
Message-ID: <CAAhV-H6j0WgN6QpHBYcdprdWBpcQq4ObYK5YcE=TVsDNxGFEtA@mail.gmail.com>
Subject: Re: [PATCH] loongarch: Only select HAVE_OBJTOOL and allow ORC
 unwinder if the inline assembler supports R_LARCH_{32,64}_PCREL
To: Xi Ruoyao <xry111@xry111.site>
Cc: Jinyang He <hejinyang@loongson.cn>, Nathan Chancellor <nathan@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, WANG Xuerui <kernel@xen0n.name>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Youling Tang <tangyouling@kylinos.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, mengqinggang@loongson.cn, 
	cailulu@loongson.cn, wanglei@loongson.cn, luweining@loongson.cn, 
	Yujie Liu <yujie.liu@intel.com>, Heng Qi <hengqi@linux.alibaba.com>, 
	Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 15, 2024 at 6:22=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> On Sat, 2024-06-15 at 17:33 +0800, Huacai Chen wrote:
> > > To me for now we should just make OBJTOOL and ORC depend on BROKEN an=
d
> > > backport to stable...
> > But this patch allows clang to build objtool, which seems broken, too.
>
> Yes, so I mean make objtool depend on CONFIG_BROKEN because it is indeed
> broken as at now.
I don't like CONFIG_BROKEN here, that means telling everyone not to
enable OBJTOOL, but that is not the case.

>
> Or we'll end up at least:
>
> select HAVE_OBJTOOL if AS_HAS_EXPLICIT_RELOCS && AS_HAS_THIN_ADD_SUB && !=
CC_IS_CLANG && !RUST
Maybe we needn't consider RUST here? And can we think
AS_HAS_THIN_ADD_SUB always imply AS_HAS_EXPLICIT_RELOCS here?

If so, we can simplify the condition. And please submit an updated version.

Huacai

>
> this is already nasty and I still don't know if it covers all broken
> cases (I've no idea if GCC will generate frame pointer in some cases as
> well...)
>
> > > Even if we can fix both the -mno-thin-add-sub problem and the frame
> > > pointer problem in these weeks, they'll be some nontrivial large chan=
ge
> > > and improper to backport.  Thus we have to admit objtool doesn't real=
ly
> > > work for old releases and mark it broken.
> > I don't like to disable objtool, unless there is no better solution.
> > And it seems there has already been some "large fix" in objtool's
> > history.
>
> Then we can still backport the large fix to the stable branches when we
> finish it up.
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
