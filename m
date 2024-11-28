Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EC4125D5
	for <loongarch@lists.linux.dev>; Thu, 28 Nov 2024 00:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732755422; cv=none; b=pys5gzIi3N3ozeFifJ46kADM1mR05q9XtoLdE/lPRYdhDkVvCXfjseeQYJ3UQ/ATim3KGBgj+H0RtaKk6iVVV/6YubynNxUj9YqT0NrmjQAqScPnN3G2FQDNyztY9gCbM7aCxveqo2aHEz7D6c00noIdhklZK7h90CAk9URVkZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732755422; c=relaxed/simple;
	bh=vs6YXMnxVt6ZuO2IeY6OKd6OXD6JflY5mqVHPDRj7lg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GGJe7XGGcxyqO/iqDF0U4I/5dACePOLLBB0dAZiv/DtcsbBsscbatBb0tcy8/qrxfdEVAIdVsu6KWlUaq9+WwT594nCU98+J9gt28qIR+67Ugzt4YMSsUP8KqxdtyN3RstOAdEt1Z2H2p6tHqpP/7ACTLBhOY5IvHyh1Z5cZPZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e2BH+OQE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e2BH+OQE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732755419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3M5NXT5NgYcv7o/jCn6O1ltoqUkEXIHN0lrzxbItZPY=;
	b=e2BH+OQELUCneetGpm7axEAv/6UEu6bFG+DlRePFRUj/lYpdIfuCvA8xDUpqVs+Eyb9i5R
	UCw7trXsRTGxjLm4jssZNX/PphJtjM6ZTNtJ9uU3B6iaj9sPM5r58X3C2ZnMuu5Hryxb4Y
	JHJpLG06BazYl5OtnQOgsC4736cIcs8=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-FtHbFG63P229xen-B05I1A-1; Wed, 27 Nov 2024 19:56:58 -0500
X-MC-Unique: FtHbFG63P229xen-B05I1A-1
X-Mimecast-MFC-AGG-ID: FtHbFG63P229xen-B05I1A
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a79f4c0729so3286275ab.3
        for <loongarch@lists.linux.dev>; Wed, 27 Nov 2024 16:56:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755417; x=1733360217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3M5NXT5NgYcv7o/jCn6O1ltoqUkEXIHN0lrzxbItZPY=;
        b=RGV3CcPkgR9B63X2p7RC5u4yIUBFb4fl8vQ2dTYgZQl8KcFEORAp3A+TFsFGEbg/NO
         +/ZPewwzrBllJ6SCi/sATt22HJUkD5kmSMvY3X3mkPRryzNOnE7q9bD4VP6zuKd54II4
         4JB+c0L7zbH9GQJjOElf42drfbN09EEhNHJlogE3AmwbBoDfCZ1i/ZICi81bBD9CTw+V
         F1sQvsVuZb4Iu2Vbza6V7D1qgsMOOr0cMgoWOCQYR0zlXvryXDkTXjKB45kzgh0WsvsJ
         EkwVFLixF6ZJC3lJJdw0Lw9PJVPhmai0etOz9LCxEfIr41zm1Y9EYBlMWrMe0PvN9B4J
         v6iA==
X-Forwarded-Encrypted: i=1; AJvYcCU/BV8f9UUaOBS/aZSpVAmcK3TTD6mc2tB8au7nLJlXwVkjyk68LnQkylRXqLSHnl6Y1hN/rVIJa40=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUWjL5lSq8+NU2404ewvnmOsg1dDlEr++LvM0FOpnbO1Upr5r9
	c9iPgu/vZ4ktJCnOgCAONf59j4igP+oIQfDxQIca+Zq0LUhT5xI3hqfiguD/wxx/yn11NvtbkLG
	ILgm8crADpuE09RphNZt6TEew/MuZHEVTRVHiRoFRuQYwjhM6YYKG2z2cUg==
X-Gm-Gg: ASbGncvfrLtTxoNeMl7z5+y1T2CP765Ybjkq8GPAdOdawYcisW/yz6E7/oYYnUApR+K
	x244ljrRIZWJ/MN1dSBZ9oxPm4VcTOI33IbvmurPnjYT+QQFcBypISv6wJQ57CZzmBilpe+Rl7T
	GCSNeeJs8HFnmS4J7ez4bwE5W1/2TDTUmC6LM/oQdyel6128NGUI+QOvpCOSOp8yZQ0Sf+wO/1x
	zgiYoT7Lhj8aa9ruH1l47DPMUpF
X-Received: by 2002:a05:6e02:1689:b0:3a7:20d5:8157 with SMTP id e9e14a558f8ab-3a7c556318dmr49585545ab.11.1732755417415;
        Wed, 27 Nov 2024 16:56:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3OUPVfIS+/L/sPPeAdCxXP7P6uumIqlNzsg8OI4AY+2yONPmztCAgPhLuzEUCMU+Gnm5xTw==
X-Received: by 2002:a05:6e02:1689:b0:3a7:20d5:8157 with SMTP id e9e14a558f8ab-3a7c556318dmr49585275ab.11.1732755417126;
        Wed, 27 Nov 2024 16:56:57 -0800 (PST)
Received: from jpoimboe ([2600:1700:6e32:6c00::1e])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e230e5f229sm54157173.82.2024.11.27.16.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 16:56:56 -0800 (PST)
From: Josh Poimboeuf <jpoimboe@redhat.com>
X-Google-Original-From: Josh Poimboeuf <jpoimboe@kernel.org>
Date: Wed, 27 Nov 2024 16:56:53 -0800
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Xi Ruoyao <xry111@xry111.site>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org,
	Jan Beulich <jbeulich@suse.com>,
	"Jose E. Marchesi" <jemarch@gnu.org>, Kees Cook <kees@kernel.org>
Subject: Re: annotating jump tables (Re: [PATCH v2 5/5] LoongArch: Enable
 jump table with GCC for objtool)
Message-ID: <20241128005653.st7xwkv2gry2chlc@jpoimboe>
References: <20241105123906.26072-1-yangtiezhu@loongson.cn>
 <20241105123906.26072-6-yangtiezhu@loongson.cn>
 <20241105141530.GE10375@noisy.programming.kicks-ass.net>
 <62df4c24-68ed-fbfc-ed98-2df796697d89@loongson.cn>
 <9589c5b673f45f02e2b0fa9d9a96eff0f0df0920.camel@xry111.site>
 <7e8adb0b-e681-72ae-40d8-740dc3f9480b@loongson.cn>
 <20241113211119.lfwlxv2bjyqfqeh2@jpoimboe>
 <CAKwvOdmE7zZN2x9echrje7dqunda=SywqurkyXyJaaUp3M0aEg@mail.gmail.com>
 <CAMj1kXF=55+z6udToxO=CZdTK910-jxKdCXpryQGg580J9eXEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAMj1kXF=55+z6udToxO=CZdTK910-jxKdCXpryQGg580J9eXEA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 28HOROtkhF0H4VnZBx9_uKMMIr-B4S6LLkZDJ3jEDlI_1732755417
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Nov 14, 2024 at 07:13:18PM +0100, Ard Biesheuvel wrote:
> > Looks like this was added to clang in:
> > https://github.com/llvm/llvm-project/pull/102411
> >
> > A comment in llvm/lib/Target/LoongArch/LoongArchAsmPrinter.cpp
> > describes the scheme:
> > +  // Emit an additional section to store the correlation info as pairs of
> > +  // addresses, each pair contains the address of a jump instruction (jr) and
> > +  // the address of the jump table.
> >
> > Ard had a prototype in:
> > https://github.com/llvm/llvm-project/pull/112606
> > which used relocations rather than a discardable section.
> 
> Thanks for the cc.
> 
> I haven't followed up yet because doing this generically is not
> straight-forward. The main issue is that AArch64 jump tables could be
> emitted into .text with scaled offsets, e.g.,
> 
> adr  x16, .Ljumptable
> ldrb w17, [x16, xN] // xN is the lookup index
> add  x16, x16, w17, sxtw #2  // x16 += 4 * x17
> br   x16
> 
> .Ljumptable:
> .byte (dest0 - .Ljumptable) >> 2
> .byte (dest1 - .Ljumptable) >> 2
> .byte (dest2 - .Ljumptable) >> 2
> .byte (dest3 - .Ljumptable) >> 2
> 
> So just emitting a relocation at the call site and a symbol covering
> the jump table might work for x86, but if we want some that works in
> general, we'll have to come up with some format that describes in more
> detail how to infer the potential destinations of an indirect call it
> is known to be a limited set at compile time.

Loongarch is emitting an array of (insn_ptr, jump_table_ptr) tuples
in .discard.tablejump_annotate.  Would that work more generically?

Even better it would also emit the jump table size.

-- 
Josh

