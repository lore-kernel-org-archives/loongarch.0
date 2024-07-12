Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557717E76D
	for <loongarch@lists.linux.dev>; Fri, 12 Jul 2024 08:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720773485; cv=none; b=i6IDsGTT7hiucSlPhJJRJ2BbFxSc8HRUhTCtWO5GLHeBg7f3OkOk+MG0cocxMM6rjbVvtXWWZ6vpjBdMW6TgPHvtNx/BjX/qtQ3r4Jh8XcleTpGe+hppgE4wRG/+W0GwvkyZ0Uuhm0n4eFDqC3H5N3NZEaOivBFJL2Uno0rf43k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720773485; c=relaxed/simple;
	bh=X4sxkxfa0puHMD2lnMvIKYZ5jErEYw2uVCAwMxYRmSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g62WBzB/tIRrFwZeOlQaA3YfxRidMhiPporkD6gMh1f3oB5nw9osPoWQMGhqm/7HvUVoZ0LIwdFjCkmuEqRCrlvrJMw5gMWuxy7mtCYp3CKaDM1aJ87mL/5Wa4CDODCPD6jI0K4nqUHz3veoLNwX8Xm23M5c2u3ToBXm9wGo+OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NeuMLK5B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NeuMLK5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E03C4AF0F
	for <loongarch@lists.linux.dev>; Fri, 12 Jul 2024 08:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720773484;
	bh=X4sxkxfa0puHMD2lnMvIKYZ5jErEYw2uVCAwMxYRmSA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NeuMLK5BqZhyYqbUqCIhCYiuR1Fg4SN7BFy8Akyzo5Pg9sZWlMzvJ8OOucNGvv+92
	 xGozI39ExmRKrL3F/ZTC/B04hFUq/GO3hTSt5RyXnaVb8ImoIXNHOT6pQfqwS6IfC/
	 K/2XpVWEUeOadxiZ7F1uRun+NSZsiYE55vTGtJ4aa9hJmaGsl6+f3woxXY1hVCKVQn
	 T1YqwtiEvHjnJqC3Fi6SMhFaQCXeexCLjoASMBFEjvZuTKmYEo9wBQtyrk5RcF9HzA
	 9/0OMdjPyTTvbRSMopQD/W+K07o/MkwUQDrLTkVHXaQbAIQwJZV273OUlm8Xh8IBTB
	 7stqWX6zwD3QA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso16296221fa.3
        for <loongarch@lists.linux.dev>; Fri, 12 Jul 2024 01:38:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0xR2gCWHHtvuOOEHuaBTcdtLe+QTMANANQBfKxX1hdeb3xiNuYfYxoiOh5lCN53hwJCDsdnDZdCdiBg3NfMxqCBvKzWTOS1Kl
X-Gm-Message-State: AOJu0Yz5k5DSwymZKN+9JcctNDJjzplQTJRVx0ge2HFu6fpzOrc6Xo41
	VggfzZHKx5PYn4bciw2nz1zXayL4H3U3+GJld+OL50pSZMWDIecELqqZQOASM5EANMo/XgGa44C
	oHU/5g8EQqkh7TSWnEFaISyvpRDw=
X-Google-Smtp-Source: AGHT+IFfkbTH0GPwVyglXJ2Er1yvq7AU75kSwOPof9lxDJA6WZS/bfYrYyjHckbhe1dyXepshm4Uwstcj4sDcu5PIlo=
X-Received: by 2002:a2e:95c6:0:b0:2ee:97b4:8028 with SMTP id
 38308e7fff4ca-2eeb30fd369mr67338551fa.31.1720773483308; Fri, 12 Jul 2024
 01:38:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240704143611.2979589-1-arnd@kernel.org> <20240704143611.2979589-4-arnd@kernel.org>
In-Reply-To: <20240704143611.2979589-4-arnd@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 12 Jul 2024 17:37:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS=h6dML-06ox1dje_bxF2+R-Gq7Yw-s73Vi-FW39L9eg@mail.gmail.com>
Message-ID: <CAK7LNAS=h6dML-06ox1dje_bxF2+R-Gq7Yw-s73Vi-FW39L9eg@mail.gmail.com>
Subject: Re: [PATCH 03/17] um: don't generate asm/bpf_perf_event.h
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Christian Brauner <brauner@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 11:37=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> If we start validating the existence of the asm-generic side of
> generated headers, this one causes a warning:
>
> make[3]: *** No rule to make target 'arch/um/include/generated/asm/bpf_pe=
rf_event.h', needed by 'all'.  Stop.
>
> The problem is that the asm-generic header only exists for the uapi
> variant, but arch/um has no uapi headers and instead uses the x86
> userspace API.
>
> Add a custom file with an explicit redirect to avoid this.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/um/include/asm/Kbuild           | 1 -
>  arch/um/include/asm/bpf_perf_event.h | 3 +++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  create mode 100644 arch/um/include/asm/bpf_perf_event.h
>
> diff --git a/arch/um/include/asm/Kbuild b/arch/um/include/asm/Kbuild
> index 6fe34779291a..6c583040537c 100644
> --- a/arch/um/include/asm/Kbuild
> +++ b/arch/um/include/asm/Kbuild
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> -generic-y +=3D bpf_perf_event.h
>  generic-y +=3D bug.h
>  generic-y +=3D compat.h
>  generic-y +=3D current.h
> diff --git a/arch/um/include/asm/bpf_perf_event.h b/arch/um/include/asm/b=
pf_perf_event.h
> new file mode 100644
> index 000000000000..0a30420c83de
> --- /dev/null
> +++ b/arch/um/include/asm/bpf_perf_event.h
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <asm-generic/bpf_perf_event.h>
> --
> 2.39.2
>


I guess this is a step backward.

Technically, kernel-space asm/*.h files are allowed to
wrap UAPI <asm-generic/*.h>.
There is no reason why we ban generic-y for doing this,
whereas check-in source is allowed.




--
Best Regards
Masahiro Yamada
