Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1244436
	for <loongarch@lists.linux.dev>; Sat, 22 Jun 2024 07:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719042400; cv=none; b=pct3dgpnC3HJRAmQSSwUc+5nakNNPokofpjRsqSBZeJQIEqdb/+yDgkw2Ok9/D+yUn0Xi6lWJqEipxzQzC2/vDuOS3kSsKjr9YAWH13LWx0hF53tTbSPR0azPuix/Osqcns5TeKK3lfstsbrt6BBUrwp8JAY1wdmBvX54AKk2BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719042400; c=relaxed/simple;
	bh=9cytvEa6KIlBHj8QUOUxiTqvIr41q4dF9wwfI9WBeZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mmh9FIxtaBfjza2v3EKcy82mVBSN8H5WkyBLFPMIdkn3KCe5BCLBhux3op0nyQhFb89/abTQDjLFsWv81oFTCLxgPH5F8AOtvrW85BJToaWXkyJKPYad7DW7LAuwjOEuidfiVYDIfwwrqqtOOsxGR+MdDi1QhymIyHorIGpHud4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooOR/zp9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooOR/zp9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77535C32781
	for <loongarch@lists.linux.dev>; Sat, 22 Jun 2024 07:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719042399;
	bh=9cytvEa6KIlBHj8QUOUxiTqvIr41q4dF9wwfI9WBeZM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ooOR/zp90fQUeop5HE3QXK9/LWuoa0M4Oiinjd9UkLs/8gdHKneCDQfO/tIwOSgsP
	 4N7i5zzH2lafDtFJtdr+J1SZaC5Bhwt02q6zHIGFVbKnmt3vCaqVGf9GLxsIH++J91
	 JScHEQl/sl9pa07gqbCIE3y37PXYbvNgUH6+tCSW3F+f0PdGFA0ABYt7lTeEehzzoD
	 VAR8vEhHEfgbX+1ZKaMxfYLQ9UYTmsBFozFtV7Rqtmx9iGsN2UmnWwCjJZkTekhN5z
	 jg6uT8ftOBwCJmJkE6KcoB9eXJqSea9aT+pbpbT0St5rh2FGKt3XogNjKVvJICfZAZ
	 6GV6Ruxb0NBgQ==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6fe118805dso35281166b.3
        for <loongarch@lists.linux.dev>; Sat, 22 Jun 2024 00:46:39 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx9vzyY/+VpwNfw3nG2JgYUaLewW1AUOjBkpOzScm1r+LZM0ISN
	v2bvNn/GRC9FcJOZLVScSVmoEJMhC2ZkKS11TY31HYWGDsoVkJr9Rh5aVgknDK7sHC5bYOKs99y
	lskbpYULIGqOR25W6UneNnf0Y7mc=
X-Google-Smtp-Source: AGHT+IHQJsfa8DsRl74q1JvK0rYXaKjnfgSwWS18EBFTOUl5InSb5KAig8QNkmLL1KJAZSAFoyoS+juFkGx0e7FmjSU=
X-Received: by 2002:a17:907:a0d2:b0:a6f:af8e:a385 with SMTP id
 a640c23a62f3a-a6faf8ea560mr483175866b.77.1719042398096; Sat, 22 Jun 2024
 00:46:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240618074303.17869-1-lihui@loongson.cn>
In-Reply-To: <20240618074303.17869-1-lihui@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 22 Jun 2024 15:46:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4yEqH3SSjw6Rm2FhKBeR1ER9cOW0A8yTrrURZksCh6JA@mail.gmail.com>
Message-ID: <CAAhV-H4yEqH3SSjw6Rm2FhKBeR1ER9cOW0A8yTrrURZksCh6JA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] LoongArch: ptrace: Fix some watchpoint function
To: Hui Li <lihui@loongson.cn>
Cc: loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn, 
	Jinyang He <hejinyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Series applied, thanks.

Huacai

On Tue, Jun 18, 2024 at 3:43=E2=80=AFPM Hui Li <lihui@loongson.cn> wrote:
>
> LoongArch defines hardware watchpoint functions for fetch and load/store
> operations. After the software configures the watchpoints for fetch and
> load/store, the processor hardware will monitor the access addresses of
> the fetch and load/store operations and trigger a watchpoint exception
> when the watchpoint setting conditions are met.
>
> Fix some hardware watchpoint issues on user-space and kernel interface.
>
> All changes are made according to the LoongArch Reference Manual:
> https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html=
#control-and-status-registers-related-to-watchpoints
>
> Testing for this series can use this gdb patch:
> https://sourceware.org/pipermail/gdb-patches/2024-June/209856.html
>
> Changes v1 -> v2:
> Suggested by Jinyang and Huacai:
> - Modify the commit message.
> - Modify the privilege level judgment in ptrace_hbp_set_ctrl() and
>   move the settings of regs->csr_prmd to hw_breakpoint_control().
> - Add judgment in ptrace_hbp_set_addr() to ensure that kernel-space
>   address cannot be monitored in user mode.
>
> Changes v2 -> v3:
> Suggested by Huacai:
> - Modify address and privilege level judgment.
> - Modify privilege level settings.
> - Make minor changes to the commit message.
>
> Hui Li (3):
>   LoongArch: ptrace: Fix watchpoint setting error
>   LoongArch: Trigger user-space watchpoints correctly
>   LoongArch: Fix multiple hardware watchpoint issues
>
>  arch/loongarch/include/asm/hw_breakpoint.h |  4 +-
>  arch/loongarch/kernel/hw_breakpoint.c      | 96 +++++++++++++---------
>  arch/loongarch/kernel/ptrace.c             | 48 ++++++-----
>  3 files changed, 86 insertions(+), 62 deletions(-)
>
> --
> 2.38.1
>
