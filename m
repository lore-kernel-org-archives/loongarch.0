Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9292DB794
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 13:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928085; cv=none; b=Y6kwIo8KsqHW1Pk5+E0rhIGscaPu+QznQX2ZCDVeX6H5wfrMa3SPjLMvylS0I32ImiuODWd3JFWrTr/onn1kH9re4ecpfHOo63SjlSVNRxXjQPlIWgL4LUo3z9ifqkV4asbgHEcyFekVAOu8VA8/ohU1/TVbiuYvbgfLU5SPIP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928085; c=relaxed/simple;
	bh=QOJle0HAErcuAk1B1GgrI2OCaaOFq04voQ/vijiMH9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AUeWODHNVLT1kfdO1c7rms+2pF0LK7fO3aj5tp7SwWxYPURZJYsfolp+aFF2o5uiCjJ7QRpOyWpNRZlCcNiRuI9Ci5YBSwDiCTut9ZfT2Y3Nsj+dygArfltCMYUI43/kMLIew6QlVFUiKR+qF72EyRNrezSxK+K0peQnRlBWGNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJfBrRJ8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJfBrRJ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59177C2BCB4
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773928085;
	bh=QOJle0HAErcuAk1B1GgrI2OCaaOFq04voQ/vijiMH9Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KJfBrRJ8sbFD3zMucjkhepLRMBdph3OktdEDcyFOVTXeM4G8ZT2NnK0Q3aOvuVzYa
	 EohsHAGYO61CRJXeh1yVgHA3aLrHZBs0Bcixk+IUqO+mwrT+1iyxQqZ2z66egbbLMU
	 P8hKWXA2iSqbRAZBe1hXdAI5cQ1yMZQ4cgP4Pt4rcrtg77ugCe4yyeo3/UKC1JfeF/
	 cxxndBaoFJoKXbaD5srTgfCVfzvhMSDeJkBzgC56sLuDx+fBr8yNVn4SdEtBQCIcaU
	 tEj+w/85QKFFNswve+Wp5aDVg+k0RGA1pcNxcNVfv3TBe5XZnC1hNcdaGiebRDFCmI
	 TUF3sXcB1e9ZQ==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79a2ee65171so10193327b3.2
        for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 06:48:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWr33TJWZQWVHAUJYGkfRjGquzOvdq9bsh8zDGTFfhmbyy6MKEf3HOivPmOsi6O0vOWr85JmPEvn6o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwD0Su9dfv+raJwkrb8lDWj+mA/fb3bTJujwU5tAnfrtRnLCBD3
	F1+T5r37AQlwwVjU6L83HcKdnRzjJ+5B27zjXD8+uVHLzhceBBmtBDg3ZyA5gBj//s9FpJNx2In
	k599l3ryKBAcD3p1MeyybiqMi6UMTIxY=
X-Received: by 2002:a05:690c:ed6:b0:79a:47b4:397b with SMTP id
 00721157ae682-79a71c9679dmr78182707b3.57.1773928084138; Thu, 19 Mar 2026
 06:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317082020.737779-1-ruanjinjie@huawei.com> <20260317082020.737779-2-ruanjinjie@huawei.com>
In-Reply-To: <20260317082020.737779-2-ruanjinjie@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 14:47:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLnBpKm7Q0hjgkRMmivpYdzY8r1-FuQS=H3Km1G=mE1fTg@mail.gmail.com>
X-Gm-Features: AaiRm50KZNLEM2TEBH0s8s1elOG_LwkGWTvhDRRNnuvJQ3BSSvTT7GXQ8nkJRwA
Message-ID: <CAD++jLnBpKm7Q0hjgkRMmivpYdzY8r1-FuQS=H3Km1G=mE1fTg@mail.gmail.com>
Subject: Re: [PATCH v13 RESEND 01/14] arm64/ptrace: Refactor
 syscall_trace_enter/exit() to accept flags parameter
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

> Refactor syscall_trace_enter() and syscall_trace_exit() to move thread
> flag reading to the caller. This aligns arm64's syscall trace enter/exit
> function signature with generic entry framework.
>
> [Changes]
> 1. Function signature changes:
>    - syscall_trace_enter(regs) =E2=86=92 syscall_trace_enter(regs, flags)
>    - syscall_trace_exit(regs) =E2=86=92 syscall_trace_exit(regs, flags)
>
> 2. Move flags reading to caller:
>    - Previously: read_thread_flags() called inside each function.
>    - Now: caller (like el0_svc_common) passes flags as parameter.
>
> 3. Update syscall.c:
>    - el0_svc_common() now passes flags to tracing functions and
>      re-fetches flags before exit to handle potential TIF updates.
>
> [Why this matters]
> - Aligns arm64 with the generic entry interface.
> - Makes future migration to generic entry framework.
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
