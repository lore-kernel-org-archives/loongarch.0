Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D83B8635D
	for <loongarch@lists.linux.dev>; Sat, 11 Apr 2026 13:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775913055; cv=none; b=Vt7sMo/7zcTd37VhIEreifzeS/1Y3e1n2cbrLchno+v/nCUVZwl0NBGksDKX1CwWpgTMFsbMZNmfJKGcPmyEKz9oxVqzmO6uDMaKd2Bu41H4nmbrSsXEIpsc+Dd/CIGQwZ0tRRZko6+AJMukLB3uO2hAtv420u2ijoNPD97LuIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775913055; c=relaxed/simple;
	bh=oyftcjDd0K774t0puJOjWtCuWRZuAU0/vZGuniuEmk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZXJldKzGpARvn3Yt0lTXg94ezDnaQKdhEkX+ot4zAeQa0DFndzIgmAY23h4stdakjHo7d8aPHrT5oWlfLhAo3CYAFX3tQaHShQaxMxvw2nvIyJEM/VkaSqQXipaOl3l4VnZpkYtYpdmlRuTaH3J8rCp7BcnUVWkeLt7c5ZC4Shk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jz5q8l4u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jz5q8l4u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA90C2BCB0
	for <loongarch@lists.linux.dev>; Sat, 11 Apr 2026 13:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775913055;
	bh=oyftcjDd0K774t0puJOjWtCuWRZuAU0/vZGuniuEmk8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jz5q8l4uWx8QHO/vRv67Ka3l4DB1+O3S8rFPdNcqglAPhKfin68cZSmpaap5pLaLk
	 AIxH+6KMwJKLEAhs6kHYS2m+YVc3f4orLnVdvxzrXJnuqsVnYWqDJPQ4h5UvUxbQIs
	 BAmEErLNHlQJrcVA5rslCjFfhHoRhx1hp9DGaYUQGbkzlxx1NEgGeiFOKlpAALuCAL
	 YZcviXggp5S9PHDprZDWGhbTHQ6ktto6ZQNnICqH2Fm/z7tTrJqLKrndz8fAkSzhz+
	 xh70z3z5Kn7RUcViBQBTLUlAkUy2ZUzlsFpK7vlEkYtv1S+3DUCIbiR/dJfzAkO7Ih
	 tbmGoAoa7jpbg==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9b1ffbb9f5so419813566b.2
        for <loongarch@lists.linux.dev>; Sat, 11 Apr 2026 06:10:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7YsfaGmdXKA3WbxxamNy9PxSKT61BCoOPLnWtCLA/3XoCSuHtJPaLNCkLP8VC7+UVFYJ7vyR1BRw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6b1aGcfZ5GLlWOTrNutQF6u/cC4twy3p7gLII3SqRSjs/WWIN
	+djcpuoi6zTuGtkdjixmgoxQAmGizSooCfpYgqSLqH/yRufcgRKo+NHGN3EPt5bcUj8PuyibmsP
	VoyiYm57Yx9saFL1/grlotEWOs4fgRAo=
X-Received: by 2002:a17:907:25cc:b0:b98:56b0:dc96 with SMTP id
 a640c23a62f3a-b9d724ded77mr379403366b.21.1775913053643; Sat, 11 Apr 2026
 06:10:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260330094845.39-1-lisa@bytefly.space>
In-Reply-To: <20260330094845.39-1-lisa@bytefly.space>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 11 Apr 2026 21:10:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Ur5RFRkhX8PGp2gfJuFBptnr9V_UuLGueqF1Uzj-GTA@mail.gmail.com>
X-Gm-Features: AQROBzD-TQGf__cFeUXF9nVF8BHyQCr2vCPi_nSO7HgIaxi0p5obgD1pNPIHUl4
Message-ID: <CAAhV-H6Ur5RFRkhX8PGp2gfJuFBptnr9V_UuLGueqF1Uzj-GTA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Align FPU register state to 32 bytes
To: Lisa Robinson <lisa@bytefly.space>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Mon, Mar 30, 2026 at 5:49=E2=80=AFPM Lisa Robinson <lisa@bytefly.space> =
wrote:
>
> Move fpr to the beginning of struct loongarch_fpu so it is naturally
> aligned to FPU_ALIGN (32 bytes), improving 256-bit SIMD (LASX) context
> switch performance.
>
> Signed-off-by: Lisa Robinson <lisa@bytefly.space>
> ---
>  arch/loongarch/include/asm/processor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/include/asm/processor.h b/arch/loongarch/incl=
ude/asm/processor.h
> index c3bc44b5f5b3..ce8b953f8c79 100644
> --- a/arch/loongarch/include/asm/processor.h
> +++ b/arch/loongarch/include/asm/processor.h
> @@ -80,10 +80,10 @@ BUILD_FPR_ACCESS(32)
>  BUILD_FPR_ACCESS(64)
>
>  struct loongarch_fpu {
> +       union fpureg    fpr[NUM_FPU_REGS];
>         uint64_t        fcc;    /* 8x8 */
>         uint32_t        fcsr;
>         uint32_t        ftop;
> -       union fpureg    fpr[NUM_FPU_REGS];
>  };
>
>  struct loongarch_lbt {
> --
> 2.53.0
>
