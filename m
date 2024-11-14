Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B686F307
	for <loongarch@lists.linux.dev>; Thu, 14 Nov 2024 17:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731604401; cv=none; b=eqqUCehbCeskSkC3QPW8Kp9MBtS+/YXek14mTKjvgKIdffuO4FuPMO2Ex39gwg5jfduqqyXEszOYID30WRrWfbO2b9mJvtZPa3xhVImo3ee2IW3+2BHcfPSZi9HlgII7vU1vOoz55MixXLNNQgF7K3IMPOcaDpobXhqJQZHvxQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731604401; c=relaxed/simple;
	bh=A80VzsnOEipCxkUh97wzvMqS3FP+WLn0ePpQ1WrySQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FDyIT209A6sydTUjYKNR9KBTLdx3tF1XUjFUOn5Bu4fC/kVN86yqXSIXBNAQGhJ706XRJ2Gr9KxamQTJEZyfbgKkuzJeL8wQ0Fksa7IJ1U9Dms6rhTOW+pO1KLn0dNRdnw3Jkz0SY7y64Od+Fs7jNYTsqNS3fXJgSuBjQNv/fgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QMzTf6ue; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QMzTf6ue"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7f4325168c8so587690a12.1
        for <loongarch@lists.linux.dev>; Thu, 14 Nov 2024 09:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731604399; x=1732209199; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2r2gffF9fCgNgH81FqMLKgByrEvtAcE8L5uD28+7jI=;
        b=QMzTf6ueMAkVV2CvKaAXln2VpnqFaaryzLPmzyxhFbJ/WkoP6sCo7E/wJPx/tsm6zV
         hjUc6+QY3SVaqMGj6Q3z5RHtZXeIMfCTKgq2mSo54yVI8Z9WG8A4h+YMyqytvGhlDAcR
         dSnxy4NGSn9CdjnEb9UthAzoZ+rOmhstpm594bFt//8IFnSkSVsgCF0SWaE36/bb8vE4
         OIOs9Gl7VLfJEhx6tXsQDiTG22bjhe4WJD0U8l9WIU8lSS6wkYaLK8UEUZYbpxVGL/c/
         kJ/3T141pCp1hAKfIuXGYfO3sXN+BQP4EjOe7A4H8yvkpRLRWoKs7mHuxtDlTqwLzX9o
         9FYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731604399; x=1732209199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2r2gffF9fCgNgH81FqMLKgByrEvtAcE8L5uD28+7jI=;
        b=tNNwYubUBa5jxd/eGrttY0iRWIPW38KxspbmlrUnBs5P0jUk3nEs8r4CkFBwoTnG/p
         qprIKtCTeO0pEvopj9pAWslah9xToYdPri0o3OcH0KFapiX99LBnPd/Qmyo2uW9APj0R
         dBTljRguCRDKCdILr/VPgkMGE6okIvN1FUXPfT5x1rCm3XR9Ksbp5BCwRNr0jrHfMzoS
         pXvquwJdHC5DyMATwHVDMxq9tq1wKeE5GIGcsKauiqZJNj0ULQErP/Zgsg2y8xaQH6FE
         6VJYEsC08GVw4FlPDOs8g4fy1ElZ5S4DFxOssfFHSBeGO/9Hyy+lymZkSn0pLypqGz8N
         ih1g==
X-Forwarded-Encrypted: i=1; AJvYcCUInHU0+KQVCncrIAgicOpxHicfw48/b0DsvO1aDOckLCsLOkQ4jNoWLWAtNNLOOGz94JYwZspsf/k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzzj+neQwnM8ynxIp7oTudYkHe0vQDo9hjMpj7N9zUBS78vzVy/
	esly5WmPwaG7zuj2UMa+XVmYVK766wB7yHiM0uot8qsRdWP/73gO9buy/luyyxsOV/wNGXF0BK6
	L5c5W9UoYKS3iRoTPeOO49Hd2aA+qWSnFkc3O
X-Google-Smtp-Source: AGHT+IGXLLQ599KLZBit3Ubp5UM43jPzJZqyV/9Pu9rr5uQzEA3J6VZvB/vvL8YEOtbhRsirwS8okjixKMtL1ARDbp8=
X-Received: by 2002:a17:902:ea02:b0:20b:ab4b:5432 with SMTP id
 d9443c01a7336-211b5bcc3b0mr111508655ad.12.1731604398795; Thu, 14 Nov 2024
 09:13:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241105123906.26072-1-yangtiezhu@loongson.cn>
 <20241105123906.26072-6-yangtiezhu@loongson.cn> <20241105141530.GE10375@noisy.programming.kicks-ass.net>
 <62df4c24-68ed-fbfc-ed98-2df796697d89@loongson.cn> <9589c5b673f45f02e2b0fa9d9a96eff0f0df0920.camel@xry111.site>
 <7e8adb0b-e681-72ae-40d8-740dc3f9480b@loongson.cn> <20241113211119.lfwlxv2bjyqfqeh2@jpoimboe>
In-Reply-To: <20241113211119.lfwlxv2bjyqfqeh2@jpoimboe>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Nov 2024 09:13:06 -0800
Message-ID: <CAKwvOdmE7zZN2x9echrje7dqunda=SywqurkyXyJaaUp3M0aEg@mail.gmail.com>
Subject: Re: annotating jump tables (Re: [PATCH v2 5/5] LoongArch: Enable jump
 table with GCC for objtool)
To: Josh Poimboeuf <jpoimboe@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Xi Ruoyao <xry111@xry111.site>, 
	Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org, 
	Jan Beulich <jbeulich@suse.com>, "Jose E. Marchesi" <jemarch@gnu.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 1:11=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Tue, Nov 12, 2024 at 08:26:56PM +0800, Tiezhu Yang wrote:
> > On 11/12/2024 11:15 AM, Xi Ruoyao wrote:
> > > On Wed, 2024-11-06 at 13:03 +0800, Tiezhu Yang wrote:
> > > > On 11/05/2024 10:15 PM, Peter Zijlstra wrote:
> > > > > On Tue, Nov 05, 2024 at 08:39:06PM +0800, Tiezhu Yang wrote:
> > > > > > For now, it is time to remove the compiler option -fno-jump-tab=
les
> > > > > > to enable jump table for objtool if the compiler is GCC and it =
has
> > > > > > the compiler option -mannotate-tablejump, otherwise still keep =
the
> > > > > > compiler option -fno-jump-tables to maintain compatibility with=
 the
> > > > > > older compilers.
> >
> > ...
> >
> > > > ifdef CONFIG_CC_HAS_ANNOTATE_TABLEJUMP
> > > > KBUILD_CFLAGS                   +=3D $(call cc-option,-mannotate-ta=
blejump)
> > > > else
> > > > KBUILD_CFLAGS                   +=3D -fno-jump-tables
> > > > endif
> > >
> > > Has -mannotate-tablejump been added to Clang?
> >
> > Yes.
> >
> > > IMO it's better to add it
> > > to Clang first, and add Clang & GCC support at once into objtool.
> >
> > Looks reasonable, the fact is that there are some corner issues
> > compiled with Clang due to different compiler behaviors, most of
> > the issues have been addressed and I need to do more test, I will
> > send v3 with about 10 patches after the coming merge window.
>
> Hm, I didn't know -mannotate-tablejump existed.  We really need
> something which supports all arches, not just loongarch.
>
> Others were looking at adding something similar (adding them to Cc).

Looks like this was added to clang in:
https://github.com/llvm/llvm-project/pull/102411

A comment in llvm/lib/Target/LoongArch/LoongArchAsmPrinter.cpp
describes the scheme:
+  // Emit an additional section to store the correlation info as pairs of
+  // addresses, each pair contains the address of a jump instruction (jr) =
and
+  // the address of the jump table.

Ard had a prototype in:
https://github.com/llvm/llvm-project/pull/112606
which used relocations rather than a discardable section.
--=20
Thanks,
~Nick Desaulniers
