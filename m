Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93F4284B29
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 13:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928226; cv=none; b=Bjx1cSYnL7gmFOw224rkQ7dnqBuemQSFeQHIJbY34ABLzjk6Pa0UycWDPH3TFxwMX8UeV00aVx02AOKiFLJvnMe5eLwoImOk0wg+sshj1U8aP0oGotLCKjIwTlhADhIz0gtRmFK0V4s8vsuybBccTA3mlRyTMrsUFvf0R6gge7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928226; c=relaxed/simple;
	bh=j89Gvis/qGEGvr15cAgXc/XjTDM6TIyQH5z20F0XvZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeJvIZ4XSFnLksMbnny00Dp82/ke/8dk/v+vLFT1tjQKUfwcY2uVVIQWdY3/9V/oVGfmv1xTuUYKS/Rj/3a4/QzX7Apu74XsaQudlNCPxl7oD/MMWTvFLZ+8BBXeLnRne1G4LNyt2MCXLMOcxvMe0/1EhPZWtEZq4iIpnagzZx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvVhDTnb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvVhDTnb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C33C2BCB4
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 13:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773928226;
	bh=j89Gvis/qGEGvr15cAgXc/XjTDM6TIyQH5z20F0XvZw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZvVhDTnbBJRhFYfSVYAon7ak9IaHBKWnN7MZO/kLi0ZIMEPNvlutWo89B/OAKDOCd
	 KtOHVMTLn2uFn9NGLroc+gay4SmnKBd+hWDSshAaBlteZ7Cmo5Hz59QSpJMJs/FIx8
	 zx3uNw4qVOafmaEnXlMruywFYprjiDjVx9fd9T8MKkGpGfB1SYfP8nXd5YUMNsFX7w
	 lYea6XoRK2/tarFTx9WxhWEUBovJq0dk49IYOnRawrd651lDVE1cjgKfJjvgH8jran
	 GWWMQ1e6N4H8vc0icLiWJLDp8c7hIvH5iiXKF4Nb7b0dg8IGlR1YteSzQqBGtTBGGk
	 UMtgLFXosyh7g==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64c9a398bc7so640702d50.2
        for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 06:50:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVRNcyz8oMA3gtexprO8Kuf40OI9IrPCwdRjTBYw514pIUuCVcF1qXMQ/3r3lr0fzuxTzMGYAOPRo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBMQX0J+6+i+bMxXW3dWRrvfKzRW7iTjKdE5SRLdrJFioY3y3M
	ubRE4Mc6FETjGmvGVyW/KFPOJVArrkOIGLtBwNQYRhl+1I3+pMRTaJDEs4a5GQLUuJbaM14TSCU
	HATlxY7SK7kpld57oUhp7wyGALYJCfwM=
X-Received: by 2002:a05:690c:e4f0:b0:799:266:83d3 with SMTP id
 00721157ae682-79a71c2b7bfmr64114747b3.47.1773928225862; Thu, 19 Mar 2026
 06:50:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317082020.737779-1-ruanjinjie@huawei.com> <20260317082020.737779-3-ruanjinjie@huawei.com>
In-Reply-To: <20260317082020.737779-3-ruanjinjie@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 14:50:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLmAxER7pR-eoJ4xs2EbGopsS4SWd+wo88xZbzkmPJp-Bw@mail.gmail.com>
X-Gm-Features: AaiRm50Qfp2UBllmGvff8saK2JFshZ6hIP4M5NvuPk-ZtFFI7-7AoZeXZeE62BY
Message-ID: <CAD++jLmAxER7pR-eoJ4xs2EbGopsS4SWd+wo88xZbzkmPJp-Bw@mail.gmail.com>
Subject: Re: [PATCH v13 RESEND 02/14] arm64/ptrace: Use syscall_get_nr()
 helper for syscall_trace_enter()
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com, 
	chenhuacai@kernel.org, kernel@xen0n.name, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, arnd@arndb.de, 
	peterz@infradead.org, luto@kernel.org, shuah@kernel.org, kees@kernel.org, 
	wad@chromium.org, kevin.brodsky@arm.com, deller@gmx.de, macro@orcam.me.uk, 
	akpm@linux-foundation.org, ldv@strace.io, anshuman.khandual@arm.com, 
	ryan.roberts@arm.com, mark.rutland@arm.com, thuth@redhat.com, song@kernel.org, 
	ada.coupriediaz@arm.com, broonie@kernel.org, pengcan@kylinos.cn, 
	liqiang01@kylinos.cn, ziyao@disroot.org, guanwentao@uniontech.com, 
	guoren@kernel.org, schuster.simon@siemens-energy.com, jremus@linux.ibm.com, 
	david@kernel.org, mathieu.desnoyers@efficios.com, edumazet@google.com, 
	kmal@cock.li, dvyukov@google.com, reddybalavignesh9979@gmail.com, 
	x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 9:20=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:

> Use syscall_get_nr() to get syscall number for syscall_trace_enter().
> This aligns arm64's internal tracing logic with the generic
> entry framework.
>
> [Changes]
> 1. Use syscall_get_nr() helper:
>    - Replace direct regs->syscallno access with
>      syscall_get_nr(current, regs).
>    - This helper is functionally equivalent to direct access on arm64.
>
> 2. Re-read syscall number after tracepoint:
>   - Re-fetch the syscall number after trace_sys_enter() as it may have
>     been modified by BPF or ftrace probes, matching generic entry behavio=
r.
>
> [Why this matters]
> - Aligns arm64 with the generic entry interface.
> - Makes future migration to generic entry framework.
> - Properly handles syscall number modifications by tracers.
> - Uses standard architecture-independent helpers.
>
> No functional changes intended.
>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
