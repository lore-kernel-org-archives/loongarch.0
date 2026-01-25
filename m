Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9841821B192
	for <loongarch@lists.linux.dev>; Sun, 25 Jan 2026 04:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769314156; cv=none; b=l7VeJf3m/1zr9DNeCQsNFS3hhQ8Xoc9wKOueXO30n1zprdPHcQrwQkZEwuIVQrN8ccnV3qg3Add3b1uizLrLN5010qXnP7n8SHMfGzt4gXuOlf7qvD+tTyYGYx2MIHTv/HHJ2v9bzx7wZi5K2brNQiQRbQMRiZ5frNUA5vjp2O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769314156; c=relaxed/simple;
	bh=cbZszWj7d5Pv6tvrS4HIXhFAe0B3wtsGNz+B1eb+KAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVh2X64yOKokL2hzZZOTtsUASezFx9ewR1ExhR+CKtwf9tJJW+mKFTPtkcYiMCh1NcdvO/9UHoBDKt6szh1PS1sfJxwX1QxRkxXs6sL/wMjabpmctinymJZjOue//2JLJrSCD/nVDHtX6r8DIMTryHOcOi77mu832xBdgu3VSvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BenoOzPQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BenoOzPQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E550FC116C6
	for <loongarch@lists.linux.dev>; Sun, 25 Jan 2026 04:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769314155;
	bh=cbZszWj7d5Pv6tvrS4HIXhFAe0B3wtsGNz+B1eb+KAI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BenoOzPQbKnbizRd/M3O6w8A8YNO7p8YfP2VDQO0mdkRUZi0QEYzPCYBzXYoV6V79
	 SZRF6LdRTIllNNYWaWLJWS2aTKLTyr+MbBKj27yRdjjetZSQWG4+3nPtdyQW5z5D0g
	 OCzCyetvJeS19mbg2XrgukP/XMbmFzZyvdimqiXMSVSGPJW4iW3ClWPzpD9cwxc+Ls
	 HIXZS3WcNNRJfRe2OEPvKZnzZ+dgQVkcQ6CKSAvM3SLNLrQ1umQypElB7nEvYo2etG
	 09pjN0E6ruqsgOMWeFMB9T0WuLE7USgUZHcsO5EcWkd+SMPINl3lMxS1yKnzw7G3rr
	 jFHmeAz1xCd2Q==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-658078d6655so7117517a12.3
        for <loongarch@lists.linux.dev>; Sat, 24 Jan 2026 20:09:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXHfxVJ5EhgQN3lpR41EwIupMXTzdIJ7w0D21FEz3xhnUYDiXCfuPxhdx/GnUP8o3pIDgOPNGYhR4s=@lists.linux.dev
X-Gm-Message-State: AOJu0YyiStvHx6K1ndkYAgIJZ4Rm7JAzie7SBQkHPfVRzHmUiAuNhhTc
	gz+35XvQHr9Sxnck++plYojX6BUblLGv3mfmS3jR6dkcM1wPPRyDhq3l+XpnN34uYjEJkS+wxxw
	x7W4PscPYWmhE8kfrs1zVN4LoRiAzXZk=
X-Received: by 2002:a17:907:7b8d:b0:b88:5b21:b16b with SMTP id
 a640c23a62f3a-b8d0693974amr41760866b.25.1769314154578; Sat, 24 Jan 2026
 20:09:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260121140840.2165381-1-hengqi.chen@gmail.com>
In-Reply-To: <20260121140840.2165381-1-hengqi.chen@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 25 Jan 2026 12:09:10 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7a-e52jdcWtQXe71R6p6CZ9yPDnMtfQbZcUO3-LG_Kmw@mail.gmail.com>
X-Gm-Features: AZwV_QjRSXMRvUT9uW8nOcrOmnQR19_JfkH0HoNxqwHhpzjx9JwWBL5dSUolIQw
Message-ID: <CAAhV-H7a-e52jdcWtQXe71R6p6CZ9yPDnMtfQbZcUO3-LG_Kmw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] LoongArch: More BPF features
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Wed, Jan 21, 2026 at 10:08=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com=
> wrote:
>
> This small set implements new features for BPF.
>
> * Patch 1 uses pack allocator for BPF programs (BPF trampoline already
>   use pack allocator, this make it complete), with this, no regression
>   on existing selftests
>
> * Patch 2 & 3 implements basic support for BPF Arena, the following
>   test cases passed:
>     - arena_htab
>     - arena_list
>     - arena_strsearch
>     - verifier_arena
>     - verifier_arena_large
>
> This is built and tested on top of the cmpxchg128 series ([0]).
>
>   [0]: https://lore.kernel.org/loongarch/20260110131124.99866-1-dongtai.g=
uo@linux.dev/T/#t
>
> changelog:
> v1 -> v2:
>   * rebase with latest loongarch-next
>   * collect Acked-by and Tested-by
>
> Hengqi Chen (3):
>   LoongArch: BPF: Use BPF prog pack allocator
>   LoongArch: BPF: Implement PROBE_MEM32 pseudo instructions
>   LoongArch: BPF: Implement bpf_addr_space_cast instruction
>
>  arch/loongarch/net/bpf_jit.c | 211 ++++++++++++++++++++++++++++-------
>  arch/loongarch/net/bpf_jit.h |   4 +-
>  2 files changed, 171 insertions(+), 44 deletions(-)
>
> --
> 2.43.5
