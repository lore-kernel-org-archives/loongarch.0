Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C916E4B5AE
	for <loongarch@lists.linux.dev>; Sun,  8 Sep 2024 12:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725796876; cv=none; b=CmjSfSjcVS3Iaj78uft49v9QN4sqIIgZwy0tCvf0TbF4j8hZfS+SV5YVlxtvF/xOA2+noJ10SFD/NNkKQiID+CaJA75hzEjDKHcPBtHOBhM1Q/KKTocv6wenH2TQxPsncvP9V3WWRavYp0Ovat/rT0ftHid+TRv12UP64qXnVIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725796876; c=relaxed/simple;
	bh=E2kGZ2T//UW2vgOICNlYkKZ3r+8PPlyrpexRqfBuAVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aBgsa8FEQ0iNAuvjO+OhRwzRHqTFqFjMgx7XZA1XyO9+L6gAIgYoNXuupY5L74uxtxR/AWkdXPOZfDStckvUVwQe7nkvi5Ke7Bfw0Jrw4eFVwVd/3yE+3KGGY+sV/g6RWCTv9J83XJGKOOBRteASTHni1wJl+TsdUV6fCAD5GXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPpwQqFQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPpwQqFQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B93C4CEC8
	for <loongarch@lists.linux.dev>; Sun,  8 Sep 2024 12:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725796876;
	bh=E2kGZ2T//UW2vgOICNlYkKZ3r+8PPlyrpexRqfBuAVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HPpwQqFQi3BxQ80EmOAanlCAJzyXejWk8EzQQtPr/a81DCjLoP8WyrWVnpN6Zdqso
	 DEhw4N0/BDnuzKzYLCGV7bHyOJZxwcFRvaeOvfnmQAXrzpKNQcveE3dZ0OVar8VZX6
	 g7XBlYv3URgqC/h49ShYaB9gCPrEvobM6gbCJceQ1x8XdKJjlLMcg7jF5P1Sc2qipx
	 Dp5TpMboAhYSwTsKW8vqgIwPVEeakQCiAB3j82UY4D1Rhwb8MULTupXWrjRNLXmWK/
	 AGxfDnnkp8E4QzYqXgWWU27w8PGOfZAwBfHCGOp2TmanRfvI3w1nVjBhzYZ7pV+gMp
	 vZM7ABbuLlRag==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c3c34e3c39so5069491a12.2
        for <loongarch@lists.linux.dev>; Sun, 08 Sep 2024 05:01:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/y+hCtNp+4LVE3UTa8UZwt8oC29hPhnXR/FwFH4oTJlERXoFEj+4i03JRtSDQ2lNLECMah5hlehQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMNHrcaF2gxa5znKkWU8GxHNBBOzpDPG3LzH/tljE0GLlc7H+N
	R+tO7jr6l5xw22wfJAt02Ucrz0wbscWR8zIHU9dCgBMtRvqjrEc181lcmFP0Npz+MlVxa5E9mwe
	k5cIL54XZwetxxGjIbYW0UZMTt+g=
X-Google-Smtp-Source: AGHT+IHIOqQMKgpHqPO7CPiHzCYy5Y8gpOstO6S+JWaYRfPsox9vVuv7uftoo0pmDs0+GF1loXf2AvjMXpIDIAOEKTg=
X-Received: by 2002:a05:6402:84e:b0:5c3:d9ce:4199 with SMTP id
 4fb4d7f45d1cf-5c3dc7c4625mr5025549a12.29.1725796874893; Sun, 08 Sep 2024
 05:01:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240807085906.27397-1-yangtiezhu@loongson.cn>
In-Reply-To: <20240807085906.27397-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 8 Sep 2024 20:01:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7Q33XpE308JsiHAJuN2uEu7Rccp1FEtofBZn=GAVOS=g@mail.gmail.com>
Message-ID: <CAAhV-H7Q33XpE308JsiHAJuN2uEu7Rccp1FEtofBZn=GAVOS=g@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Fix objtool issues about do_syscall() and Clang on LoongArch
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Xi Ruoyao <xry111@xry111.site>, 
	Jinyang He <hejinyang@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ruoyao and Jinyang,

On Wed, Aug 7, 2024 at 4:59=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn>=
 wrote:
>
> With this series, there is no objtool warning about do_syscall() and
> there is handle_syscall() which is the previous frame of do_syscall()
> in the call trace when running "echo l > /proc/sysrq-trigger".
>
> Compiled with GCC and Clang, tested with the following two configs:
>
> (1) CONFIG_RANDOMIZE_KSTACK_OFFSET=3Dy &&
>     CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=3Dn
> (2) CONFIG_RANDOMIZE_KSTACK_OFFSET=3Dy &&
>     CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=3Dy
Please review this series. If you have no objections, I will apply to
loongarch-next.

Huacai

>
> Tiezhu Yang (4):
>   objtool: Handle frame pointer related instructions
>   LoongArch: Remove STACK_FRAME_NON_STANDARD(do_syscall)
>   LoongArch: Set AS_HAS_THIN_ADD_SUB as y if AS_IS_LLVM
>   LoongArch: Enable objtool for Clang
>
>  arch/loongarch/Kconfig                |  4 ++--
>  arch/loongarch/kernel/syscall.c       |  4 ----
>  tools/objtool/arch/loongarch/decode.c | 11 ++++++++++-
>  tools/objtool/check.c                 | 23 ++++++++++++++++++++---
>  tools/objtool/include/objtool/elf.h   |  1 +
>  5 files changed, 33 insertions(+), 10 deletions(-)
>
> --
> 2.42.0
>
