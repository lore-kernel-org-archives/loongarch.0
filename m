Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C077146A8E
	for <loongarch@lists.linux.dev>; Fri, 14 Jun 2024 19:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718393227; cv=none; b=pcIutXsDJ3aie3xyfKCEevxdXhk4/zlnuLuMqCmYwJD+UmHkJGpzMVQvgpfphuqrN6sIMgPHLvgkgojiNyO0byJrzYgnZZzaFJR+RSG0SEaFVnE0IGv3bpsdBARgpAIV3xVjm+TwUvBx18v2DrCYZpx9ftz6KSPZuECkCdd3Kr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718393227; c=relaxed/simple;
	bh=35nCSzvM8kCj1i7vnYnO/mrxOdXV2sc3Q/F9sfkJAOc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihRyv5O+Almroh9eAy1DxVchkH/yT58lDzQGaoX0ccURt8n2RWynivhPhCPM8DutckIPIFLu5M4Sd/1IS92woEwWteAV7dgyApxlAgUYPxOz3ord+5xcGrj4uZ7Ve0pLYJ3uLFXlJ4yzIJcOfW0A/4TPgrVp/GWVThBnONn/RZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3lO3l8m; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3lO3l8m"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57ca578ce8dso3005868a12.2
        for <loongarch@lists.linux.dev>; Fri, 14 Jun 2024 12:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718393224; x=1718998024; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N/f45cUWEGs5NCDhyksDKpsG/5a7jeEGEkHeXxZvwig=;
        b=P3lO3l8m4ODI7dLNzhIw6SAiO3mYEJG3jRN59dlkFXlZb5yUEGF0OV/zHuGrEKvjgZ
         fIwC4qB5AnKHu8n8zgk7qUDQEMIPXnTQDm4FbaAP9oIrFgT5Q0etmWAoUfLoYQE0LlUV
         e7Gg+9mnilr5vLR1SFR7AH4P5+Y6J1hhJndawAJthx8+yuJ4ArawnVsYZeKx5nCVlFXf
         IYD8W5Ibq8JZ4xqVrqc0gqSTgmdnGGM6yE2Z9ARCh1mrJHddF5aWshx3VV2dqR90+1r0
         XBNDqu5m6ULTeUq/TDFOrF+pGxyiPr530lbK+e4DZjD6meHBPUAmkBdAyb/F3vKmQyRh
         EeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718393224; x=1718998024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/f45cUWEGs5NCDhyksDKpsG/5a7jeEGEkHeXxZvwig=;
        b=HxcHtkLDWcLQ+vr7DY1xfvJ+UWaY0LlPRZNd59sWQYjE5dTHrWzJvl5NVK4NG2yYc8
         p/zNJV7s3ZVyfARgCHLDx/fp+n0lflLj48d0YXAeVd58B2blNy/deF9I9yzkvylNhzak
         VS3r+O/8KkTRWnRHy11RftUYpWJPYOx4kaWr6U1tzSjrCtDsmVIni5dI7G15hFaolq15
         DqKHlpjQA9Jb6MHm5m3bUBWs2Go+svHZis0F6+RvOg75PGiSiJahz5AzJnftDSz2fjX+
         SK72+IoyzHRvS1mjJ9jZe7lGnvZOVsATRxx5W3kZiSAT4qms23tmaeapys9gJG4xt+HG
         zAHw==
X-Forwarded-Encrypted: i=1; AJvYcCW3T4A6uv0wJ4bUROaGQeiKHuTlKkP3IHfRtXSOPKUxUJgQOzI4/Gl5jQRWxEP1nSNygNt3E3barKtOegoYq0ifXxGCHWVFeL0B
X-Gm-Message-State: AOJu0YxjOTcnb0xrDGBkA41uqeh0HD9YOZ5GHmlRj6FJykwsJMQ4V4JE
	wRakpTojMkEakRMfHb0HkBiIBjdLcz5FmknQ8n+mCAm3CgpaJINr
X-Google-Smtp-Source: AGHT+IE5P2ppWpL73Yodf7MQMfk0pnKefj/Rj7aJgWIatWunL9deqlc5gXv5FoQ7KDjv22ttI6eDEw==
X-Received: by 2002:a05:6402:520d:b0:57c:c166:ba6 with SMTP id 4fb4d7f45d1cf-57cc1660fc5mr2433523a12.19.1718393223504;
        Fri, 14 Jun 2024 12:27:03 -0700 (PDT)
Received: from krava (85-193-35-172.rib.o2.cz. [85.193.35.172])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72cdfc4sm2607662a12.19.2024.06.14.12.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 12:27:03 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 14 Jun 2024 21:26:59 +0200
To: Nathan Chancellor <nathan@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	linux-man@vger.kernel.org, x86@kernel.org, bpf@vger.kernel.org,
	Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Ingo Molnar <mingo@redhat.com>, Andy Lutomirski <luto@kernel.org>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev
Subject: Re: [PATCHv8 bpf-next 3/9] uprobe: Add uretprobe syscall to speed up
 return probe
Message-ID: <ZmyZgzqsowkGyqmH@krava>
References: <20240611112158.40795-1-jolsa@kernel.org>
 <20240611112158.40795-4-jolsa@kernel.org>
 <20240614174822.GA1185149@thelio-3990X>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614174822.GA1185149@thelio-3990X>

On Fri, Jun 14, 2024 at 10:48:22AM -0700, Nathan Chancellor wrote:
> Hi Jiri,
> 
> On Tue, Jun 11, 2024 at 01:21:52PM +0200, Jiri Olsa wrote:
> > Adding uretprobe syscall instead of trap to speed up return probe.
> ...
> > diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
> > index 2c83ba776fc7..2816e65729ac 100644
> > --- a/kernel/events/uprobes.c
> > +++ b/kernel/events/uprobes.c
> > @@ -1474,11 +1474,20 @@ static int xol_add_vma(struct mm_struct *mm, struct xol_area *area)
> >  	return ret;
> >  }
> >  
> > +void * __weak arch_uprobe_trampoline(unsigned long *psize)
> > +{
> > +	static uprobe_opcode_t insn = UPROBE_SWBP_INSN;
> 
> This change as commit ff474a78cef5 ("uprobe: Add uretprobe syscall to
> speed up return probe") in -next causes the following build error for
> ARCH=loongarch allmodconfig:
> 
>   In file included from include/linux/uprobes.h:49,
>                    from include/linux/mm_types.h:16,
>                    from include/linux/mmzone.h:22,
>                    from include/linux/gfp.h:7,
>                    from include/linux/xarray.h:16,
>                    from include/linux/list_lru.h:14,
>                    from include/linux/fs.h:13,
>                    from include/linux/highmem.h:5,
>                    from kernel/events/uprobes.c:13:
>   kernel/events/uprobes.c: In function 'arch_uprobe_trampoline':
>   arch/loongarch/include/asm/uprobes.h:12:33: error: initializer element is not constant
>      12 | #define UPROBE_SWBP_INSN        larch_insn_gen_break(BRK_UPROBE_BP)
>         |                                 ^~~~~~~~~~~~~~~~~~~~
>   kernel/events/uprobes.c:1479:39: note: in expansion of macro 'UPROBE_SWBP_INSN'
>    1479 |         static uprobe_opcode_t insn = UPROBE_SWBP_INSN;

reproduced, could you please try the change below

thanks,
jirka


---
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 2816e65729ac..6986bd993702 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -1476,8 +1476,9 @@ static int xol_add_vma(struct mm_struct *mm, struct xol_area *area)
 
 void * __weak arch_uprobe_trampoline(unsigned long *psize)
 {
-	static uprobe_opcode_t insn = UPROBE_SWBP_INSN;
+	static uprobe_opcode_t insn;
 
+	insn = insn ?: UPROBE_SWBP_INSN;
 	*psize = UPROBE_SWBP_INSN_SIZE;
 	return &insn;
 }
