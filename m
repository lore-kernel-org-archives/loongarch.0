Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13883845AE
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 13:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928707; cv=none; b=K3jRyLpUU7Lsp0zAlonpL9Q6m76J/UWvj0WODHdMfZOyuyZvZIMPytTKeYjttYw5fCsvrdaLFDubTT8KJv8avVD4y36cYDYHd4Vp6RStTh570krApcfflXKPfRxM8m9JNz7S/AN/ESCHoWM2/6JWosV0d+pu7rVNZGi1ZiSSyYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928707; c=relaxed/simple;
	bh=vVMhOhWZVSxPZj7h/gXJPr3MbzsLXumfcz/WsvzXiiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nnWpJrtnftLnoy1Rjf6qO2x2bstKK07QxUZTrN2jmU0VfxTZd4cXOan6O1eGObjjn0yoXD9wUBsT1efqa52IrDv9obSsPJ08e+eQ3FVoX0Zda+KXCSc2/dRTSShHWmMV61djC73PGzVjAPpMvZJWz8BlpJAbrPBBNshBH4r8Q0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nquVz4we; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nquVz4we"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26C6C2BC9E
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773928706;
	bh=vVMhOhWZVSxPZj7h/gXJPr3MbzsLXumfcz/WsvzXiiw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nquVz4wePYQWwp++fkGjsQ/zzhCXcFg1E5jkD/ap2qU6BcDWf2G7O9/h3Xjc3KqoR
	 xZOoxAU/EYR1SbobsB2b1KL10UFdLSBPMUWn+2ubwG9QrJWzb8iUOawUPp++lB32az
	 wxcKCXi1YYaSK+e6pU6zFQ1paLVB5TBs7XNOiM/v2VtkgxQdF5XCI+Fg6AWnkCzCRW
	 3/XDtYwAFF48icMzoqOzYzLukR0VGddABOWBecgCNp1fCf/BIHX/sI+dJPaPUXfKzZ
	 UVN6yWHPxvDB+0E61av3DphnUilQvG4gn1XF6SgykuUPRqci/ei+ewvrOBKQK1aCdY
	 qLBdT43iQpCJw==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7947cf097c1so10080257b3.2
        for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 06:58:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrAbUmvwp5xYxnpNzzzZ9dSNFYhRcRNjt8pY81Pi/Gb30VqDBJ/8prY5J/HBvY3W875gGXKpvo8eA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlBGGR1A0M/blTtK1z3fPLlC/WA3QxgOa/NXzzj5KkmbZOzR42
	3M1r8hiLkyd5dW2AXss4ZTxrV3Bpq7Tk0PsYLlApUL7SAQN/Z3FR1lnxGlOT3bRhjX2hvNccH0L
	vuGWJP8FEiIjCchyTYnAinfwjh5M9Tno=
X-Received: by 2002:a05:690c:8e07:b0:79a:3d7f:e8f6 with SMTP id
 00721157ae682-79a7183077emr59279997b3.5.1773928705112; Thu, 19 Mar 2026
 06:58:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317082020.737779-1-ruanjinjie@huawei.com> <20260317082020.737779-4-ruanjinjie@huawei.com>
In-Reply-To: <20260317082020.737779-4-ruanjinjie@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 14:58:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLm3We3Bx4s0BQ4vSX==YKsBw81mtzDV4vnP+cK3ZFp5rg@mail.gmail.com>
X-Gm-Features: AaiRm52iu4yIzLq9nfoEu1nkVquuu7rND0JnY3PWtoDRG8G2aTchcsb5vToiAw8
Message-ID: <CAD++jLm3We3Bx4s0BQ4vSX==YKsBw81mtzDV4vnP+cK3ZFp5rg@mail.gmail.com>
Subject: Re: [PATCH v13 RESEND 03/14] arm64/ptrace: Expand secure_computing()
 in place
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

> Refactor syscall_trace_enter() by open-coding the seccomp check
> to align with the generic entry framework.
>
> [Background]
> The generic entry implementation expands the seccomp check in-place
> instead of using the secure_computing() wrapper. It directly tests
> SYSCALL_WORK_SECCOMP and calls the underlying __secure_computing()
> function to handle syscall filtering.
>
> [Changes]
> 1. Open-code seccomp check:
>    - Instead of calling the secure_computing() wrapper, explicitly check
>      the 'flags' parameter for _TIF_SECCOMP.
>    - Call __secure_computing() directly if the flag is set.
>
> 2. Refine return value handling:
>    - Use 'return ret ? : syscall' to propagate the return value.
>    - Ensures any unexpected non-zero return from __secure_computing()
>      is properly propagated is properly propagated.
>    - This matches the logic in the generic entry code.
>
> [Why this matters]
> - Aligns the arm64 syscall path with the generic entry implementation,
>   simplifying future migration to the generic entry framework.
> - No functional changes are intended; seccomp behavior remains identical.
>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
