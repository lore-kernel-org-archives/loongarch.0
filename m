Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D59EEC4
	for <loongarch@lists.linux.dev>; Fri, 21 Jun 2024 13:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718975884; cv=none; b=qmsAtdrUGA5PDtZavs3wdUfZAFRPPVWCELjROhgm/WTpXVEh5jFqt9BdNiC5Jm7DxJmkz0N+SCGzcSCNK0lMd7yIgA7lb7rRAAQzlHY8KqxfHIMVx2EAzn0ZIbj5yZHXonkv2wdItqVTtCeASX0f3kpW2M4PFtq23hup8iziH3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718975884; c=relaxed/simple;
	bh=NTlU4MzAnhhcT3IXIo/UnGQRRM53fAqVg82XwxlIG3s=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8patnco3wykoXMp46UB+EImT3yPY1czHBIa63BmVL8PkM6w4pkI8cANIHL3qTREvu2gA9ZqaaG8+qiPTYvHd9FS+OMOrMnjTsLnJZ5fnRY7Tdny6DinwILNLr75h61UktmeUcmPIxDSlW80uQl9UhDnchmnfXxtZapkJA0wMiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkr4pOEL; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkr4pOEL"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52bbf73f334so1750360e87.2
        for <loongarch@lists.linux.dev>; Fri, 21 Jun 2024 06:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718975881; x=1719580681; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Va7fQxN9lBsLo744XPC53nXOlbU4afLajRDQWh9HAcM=;
        b=dkr4pOELcRHnl6laNVnLWJqQhSGhBr2Dcn/5IVI9UijySzhhBNb3+9o6eLlfMsmLsr
         KbrFqOwKqR6bjHlxiqVcBjCLS1WRef+0kutJ0RgQUgBDgrBcGuNvLasC8cqoQc4Ov1rL
         eUIDPTGwzV03o+UDEb3wbT70UH8Z7eskMDaN+/I4fh9bbiCrjB5jQD1kz/E6hpYPvpfu
         C6BDAn6uwEChVPq2tQITqFeF/qN2Rx8sUjzphrV8ZGcPsdeFGdrSMApUGGBSKKW7Bin2
         vzWtwC+acuuwubcR9g2nu5LYSD9hZbBbACU+DUN/yKiF/E3jakLCoYxR+JRpAPOmbJLe
         kBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718975881; x=1719580681;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Va7fQxN9lBsLo744XPC53nXOlbU4afLajRDQWh9HAcM=;
        b=ob1NhI/2mkipr76juHySSArLFmabrezOC82l14WAoHmbLAopJB9x/2Si9zY5C2Mn6Q
         jnAmONk211S/CXM7PjBfTr0f0fxXTS/HC/TfiQXGyfaGSpv+6i5akPfu5uyiwOjj1t4B
         RYDIKBUKdCOY2v686nYo/Ykc8Wt2/AdUgIIIB7n6h+AJihzvPfUDw/TpRRsszgAa6RtR
         Dkij1cotml3EL4sv+ZCvx2fwimQ72F/sakzFKKaohjvPu3rhsqycy5kSDbj5u0J/Cwia
         DC6UmbhXbmgndmzErCva27E748xPE4bTvPmCR+MvRnieNewuK1SuX/ZNndbQYWC7Ts7f
         37AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUehxWkTpryD1m9ZKYHEhnlZzsX/Y+AoQBVwTtEf2mtxb0WGcRLYmmcdT57Ymzj3brrbX9mKgIYjLIx6OKi7VVV1l3dxiaB+8T8
X-Gm-Message-State: AOJu0YxumQ8fXufI1hYlW6W0c61ZwKmkgaaGrQ5XyrjpX+pgw3/a257d
	cIILGDxjdnKr/8Y48L/Uaob88cHQlltExibg1MQcBFciMraPX92T
X-Google-Smtp-Source: AGHT+IHkhqARK5Dooq1qSnFt+7oS2w45OWcGar+Ac/wnacPVJSV9FXzNu8K18xQUDgDf/Jb4mgoyTA==
X-Received: by 2002:a05:6512:138c:b0:52c:cda0:18b9 with SMTP id 2adb3069b0e04-52ccda01977mr5931095e87.59.1718975880879;
        Fri, 21 Jun 2024 06:18:00 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817a8d8esm27985845e9.12.2024.06.21.06.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 06:18:00 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 21 Jun 2024 15:17:58 +0200
To: Oleg Nesterov <oleg@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH] uprobe: Do not use UPROBE_SWBP_INSN as static initializer
Message-ID: <ZnV9hvOP5388YJtw@krava>
References: <20240618194306.1577022-1-jolsa@kernel.org>
 <CAEf4BzbN4Li2iesQm28ZYEV2nXsLre8_qknmvkSy510EV7h=SA@mail.gmail.com>
 <20240620193846.GA7165@redhat.com>
 <CAEf4BzaqgbjPfxKmzF-M7nzGroOwKikA0BM7Tnw7dKzKS+x9ZQ@mail.gmail.com>
 <20240621120149.GB12521@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240621120149.GB12521@redhat.com>

On Fri, Jun 21, 2024 at 02:01:50PM +0200, Oleg Nesterov wrote:
> On 06/20, Andrii Nakryiko wrote:
> >
> > On Thu, Jun 20, 2024 at 12:40 PM Oleg Nesterov <oleg@redhat.com> wrote:
> > >
> > > But I can't understand what does it do, it calls emit_break() and
> > > git grep -w emit_break finds nothing.
> > >
> >
> > It's DEF_EMIT_REG0I15_FORMAT(break, break_op) in
> > arch/loongarch/include/asm/inst.h
> >
> > A bunch of macro magic, but in the end it produces some constant
> > value, of course.
> 
> I see, thanks!
> 
> Then perhaps something like below?

lgtm, added loong arch list/folks

for context:
  https://lore.kernel.org/bpf/20240614174822.GA1185149@thelio-3990X/

thanks,
jirka

> 
> Oleg.
> 
> 
> --- x/arch/loongarch/include/asm/uprobes.h
> +++ x/arch/loongarch/include/asm/uprobes.h
> @@ -9,7 +9,7 @@ typedef u32 uprobe_opcode_t;
>  #define MAX_UINSN_BYTES		8
>  #define UPROBE_XOL_SLOT_BYTES	MAX_UINSN_BYTES
>  
> -#define UPROBE_SWBP_INSN	larch_insn_gen_break(BRK_UPROBE_BP)
> +#define UPROBE_SWBP_INSN	(uprobe_opcode_t)(BRK_UPROBE_BP | (break_op << 15))
>  #define UPROBE_SWBP_INSN_SIZE	LOONGARCH_INSN_SIZE
>  
>  #define UPROBE_XOLBP_INSN	larch_insn_gen_break(BRK_UPROBE_XOLBP)
> --- x/arch/loongarch/kernel/uprobes.c
> +++ x/arch/loongarch/kernel/uprobes.c
> @@ -7,6 +7,13 @@
>  
>  #define UPROBE_TRAP_NR	UINT_MAX
>  
> +static __init int __ck_insn(void)
> +{
> +	BUG_ON(UPROBE_SWBP_INSN != larch_insn_gen_break(BRK_UPROBE_BP));
> +	return 0;
> +}
> +late_initcall(__ck_insn);
> +
>  int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe,
>  			     struct mm_struct *mm, unsigned long addr)
>  {
> 
