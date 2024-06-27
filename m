Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6AD193099
	for <loongarch@lists.linux.dev>; Thu, 27 Jun 2024 13:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719495863; cv=none; b=rUtfSa6ElqPxvJ8P7Cb/+5743DrSWsuAWnUrb3Aq0IG0y8inHQdSFrxoek4un0KK8yX8GkaLBUKt3utwVRLsJo8Vs7VXwMyOJS4hvlyj0Sd/5Oa2OYu0gzLukkiDu8k2uWmusHIu7GKcsN64aQIyi0lbm/1qG1XBXK+v00CXY5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719495863; c=relaxed/simple;
	bh=Ul6G/nJq1NqsvPPUxn1ztVYbl+D8KaF4w3zcLhTazvM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rnr+8tG7qp/0n4IJjKcKGnD0FeINUh0t1XtSfIbvgX5ccG1RgUoHrN+Bt1k/npMlg54RLBvRyvE6JCPOMHIuDS75nD4kOSfZZiRtk3ydmkEOaXTL6i5mZUma6j38B7dfohbBaVpRPtkT3Pvr0W+itm2DzWYu4msrcIMJ/1qtlng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ea2xCysQ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ea2xCysQ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57d1d614049so1937562a12.1
        for <loongarch@lists.linux.dev>; Thu, 27 Jun 2024 06:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719495860; x=1720100660; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+z2OIiBoWk61ptokEVO+KMQtz628M7t7de8HsxCdEX4=;
        b=Ea2xCysQmN19E3t9yq2CvtZ1jUKUeB2f1W4SeM1a3g3XgSXPTAmmzc7o3VeUWymLa6
         fP0crgDWFgB5NHO8I5FNrTqN1tj6TFULvLRs5JaQboD5M1qjo2HlG5/bAeRTHJNryG71
         vSjEZ+iC94HwbBcSTjS7XPBBtUNPcTS3eAWQcXWguJ9ES1eaAHFr3fwvgJyHbZKiS3U+
         YJOnfHtPyjgncmD+PV0ywcs4SXT1AgZywzHR36daACVtPf+e9HdAmEFJf/WkUOD4gj/g
         hABKgdGKupMgjG6bMyoaT75gCfWUAhuUEUh5P0dpsfiarnAacUkjOrUmbWHNamDjl2id
         VopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719495860; x=1720100660;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+z2OIiBoWk61ptokEVO+KMQtz628M7t7de8HsxCdEX4=;
        b=OaWRlT3Ifn+Z8RziaKozo69T1DWFJKqrW+220vN/juEZ6YKJpxeDZ0MtMB3IrLs5IX
         S1qXcBVXsmuupDz552mriwwfyyniTM7Hyl2kqxg4O/zoJM81nFf/Y0VqJBYJRbiOwlhy
         b0+/TPUBz9qW6Qr4U6+AGMYga838OEfRhpLwtfO8q1iYIXC470A00Wi/VcudQfxFlDsK
         uYJDPnVlJTr2C/edK2QepuikCq3+n89HfBGCdCeIkhUtBkRugdRmFglJCEfbokBdUhOF
         8fJ93mb/duzt/W4ujZ5qu+5o/A5UjUBvXvzCMPRnsdIyZzB2SIADmq5Em/P50lRAyqdi
         g+6A==
X-Forwarded-Encrypted: i=1; AJvYcCVoapLMTKkGEFqLvWE6OTtMhJASssM+qMpYjytKBRBRGVljmX0/WO94KosbeA8XsjYHoldSNCD2xCINJkQgXPtHuSXk9lubQjQ/
X-Gm-Message-State: AOJu0YwBAbd+gkMtAu5jlaUQd0bAS3XJmVoisvQObWuPobvbRuDy8ajq
	EgfRakUXbEKAjPSXTdHLXODY4IwljBNtqpeWaDm+QKJMrxmwiZfq
X-Google-Smtp-Source: AGHT+IEGZJ8GU/lUTDP7HIhY+S/dmDAgLYptgqhK+X5p8UjuwE0YVnPKygAdrtwn11XNkTNIchFk2w==
X-Received: by 2002:a50:f604:0:b0:57c:ad11:e759 with SMTP id 4fb4d7f45d1cf-57d4bdbe905mr11369584a12.28.1719495860340;
        Thu, 27 Jun 2024 06:44:20 -0700 (PDT)
Received: from krava (net-93-147-243-244.cust.vodafonedsl.it. [93.147.243.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-584d16bae13sm896890a12.43.2024.06.27.06.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 06:44:19 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 27 Jun 2024 15:44:16 +0200
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH] uprobe: Do not use UPROBE_SWBP_INSN as static initializer
Message-ID: <Zn1ssLPeMj-On_uT@krava>
References: <20240618194306.1577022-1-jolsa@kernel.org>
 <CAEf4BzbN4Li2iesQm28ZYEV2nXsLre8_qknmvkSy510EV7h=SA@mail.gmail.com>
 <20240620193846.GA7165@redhat.com>
 <CAEf4BzaqgbjPfxKmzF-M7nzGroOwKikA0BM7Tnw7dKzKS+x9ZQ@mail.gmail.com>
 <20240621120149.GB12521@redhat.com>
 <ZnV9hvOP5388YJtw@krava>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZnV9hvOP5388YJtw@krava>

On Fri, Jun 21, 2024 at 03:17:58PM +0200, Jiri Olsa wrote:
> On Fri, Jun 21, 2024 at 02:01:50PM +0200, Oleg Nesterov wrote:
> > On 06/20, Andrii Nakryiko wrote:
> > >
> > > On Thu, Jun 20, 2024 at 12:40 PM Oleg Nesterov <oleg@redhat.com> wrote:
> > > >
> > > > But I can't understand what does it do, it calls emit_break() and
> > > > git grep -w emit_break finds nothing.
> > > >
> > >
> > > It's DEF_EMIT_REG0I15_FORMAT(break, break_op) in
> > > arch/loongarch/include/asm/inst.h
> > >
> > > A bunch of macro magic, but in the end it produces some constant
> > > value, of course.
> > 
> > I see, thanks!
> > 
> > Then perhaps something like below?
> 
> lgtm, added loong arch list/folks

ping

Oleg, do you want to send formal patch?

thanks,
jirka

> 
> for context:
>   https://lore.kernel.org/bpf/20240614174822.GA1185149@thelio-3990X/
> 
> thanks,
> jirka
> 
> > 
> > Oleg.
> > 
> > 
> > --- x/arch/loongarch/include/asm/uprobes.h
> > +++ x/arch/loongarch/include/asm/uprobes.h
> > @@ -9,7 +9,7 @@ typedef u32 uprobe_opcode_t;
> >  #define MAX_UINSN_BYTES		8
> >  #define UPROBE_XOL_SLOT_BYTES	MAX_UINSN_BYTES
> >  
> > -#define UPROBE_SWBP_INSN	larch_insn_gen_break(BRK_UPROBE_BP)
> > +#define UPROBE_SWBP_INSN	(uprobe_opcode_t)(BRK_UPROBE_BP | (break_op << 15))
> >  #define UPROBE_SWBP_INSN_SIZE	LOONGARCH_INSN_SIZE
> >  
> >  #define UPROBE_XOLBP_INSN	larch_insn_gen_break(BRK_UPROBE_XOLBP)
> > --- x/arch/loongarch/kernel/uprobes.c
> > +++ x/arch/loongarch/kernel/uprobes.c
> > @@ -7,6 +7,13 @@
> >  
> >  #define UPROBE_TRAP_NR	UINT_MAX
> >  
> > +static __init int __ck_insn(void)
> > +{
> > +	BUG_ON(UPROBE_SWBP_INSN != larch_insn_gen_break(BRK_UPROBE_BP));
> > +	return 0;
> > +}
> > +late_initcall(__ck_insn);
> > +
> >  int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe,
> >  			     struct mm_struct *mm, unsigned long addr)
> >  {
> > 
