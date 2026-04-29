Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BED03BADAA
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 10:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777457572; cv=none; b=JPlRwuTmIFZnXyk78pDJMeqJlBcwyLnZxdzkrNVTcD+dPs/HFeiUjSoVGDJHcwDJpBTzLVxy3MhqjPb49l5RYgg4yLcqjvEGvjXGv3WUrxaBfXllQuPtuUk1+/ngyEIyyAVoccfwnaQ3W8p66nVGM0TkNiYWcO6+w1fRPBZRa0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777457572; c=relaxed/simple;
	bh=WmBRG7ybVpEVt5f1Yz8SeR7dvYo1ePWwV4o7bJ6Ib3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MjjpBazXofOZZWZ8i83VzS4ZKgBRAnWkl1kMMTX4UHq9j7Cl6RQehr0U0TBTTXcryFrRnB/ZpV/tbqtpqtYI4HWlNHMzRD6krinOD3D6cecdpzLfDiMfI6YarpK6ZHsFOfWCR/NhvYZ5Qc/O794JUcEuiLndF7NkKJQ3bTGkYAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EQ1zh1QG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQ1zh1QG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EC1C19425
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 10:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777457571;
	bh=WmBRG7ybVpEVt5f1Yz8SeR7dvYo1ePWwV4o7bJ6Ib3I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EQ1zh1QGvUftl+owdFJu/U9dsHc5j4rXdlhtb6Mt704Mzn38Pymwmvr/gZTciQkr7
	 kJ2Be4eTVFTtGKGUJbUdsDWFD+zxz7+Qx8MoE7yNhQxDXG58Zshts0tT+H28uo+F/c
	 ooi2MEIQ9isAKNR7bKHgx+66PzWH9eQqSMkclKm/zYWPEANn4IDKwqMTE9JCEIv/is
	 9AzpO2Pf2/rUqF/Wfsf/9rt6MTuj+fuc5lU+IVcUTaXWpA9WQiZFtxY7aI2CNOwukt
	 U4PkXEGr/MrbnMJLFHN6V2qzVg4GZu9mZCqB1zUwubrkOLYUkrK/O6gwqkpPp/y7Oc
	 3J8HPUnezDfUg==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-671dad7cac8so17855993a12.0
        for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 03:12:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8SpmhQINVLIxFw9WNJN+Oek/22G6TQEeBl6JhdqExEGPdMRwNsmS8BIjMi98TxrCz6kw6vy8H6tKU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjtzsTMgWm81r/2g/JP6RRXJnD0Hs5tlhuNx/zBTMnu83p/DtZ
	f2RfoMeuxxvj7r2thHDJL4C7HTF2Iq6qgS0EGqQ+Zg4Jjy2nk1SgfobH2DvzAoaGFyYZEke24ml
	RFwcglRW5hQ9ZaBH9oiV9DpNi/fgiRBk=
X-Received: by 2002:a17:907:874b:b0:ba6:8a6c:f91d with SMTP id
 a640c23a62f3a-bb804537cffmr412174666b.36.1777457570525; Wed, 29 Apr 2026
 03:12:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260414072313.3801110-1-maobibo@loongson.cn>
In-Reply-To: <20260414072313.3801110-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 29 Apr 2026 18:13:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5+mR5gnd6x6yUEFK7ZnWyYQVTiE6C=enk7bHxe2Mo2Sg@mail.gmail.com>
X-Gm-Features: AVHnY4IE7b_uD3Pu012Z-8FrM3vF54CDje-BOBCpe2XN_WV3r3i-oCnlJyOGEcE
Message-ID: <CAAhV-H5+mR5gnd6x6yUEFK7ZnWyYQVTiE6C=enk7bHxe2Mo2Sg@mail.gmail.com>
Subject: Re: [PATCH 0/3] LoongArch: KVM: Small enhancement about timer
To: Bibo Mao <maobibo@loongson.cn>
Cc: kernel@xen0n.name, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The first patch cannot be applied cleanly, I adjusted it and applied,
hope it is correct.
https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.g=
it/log/?h=3Dloongarch-next


Huacai

On Tue, Apr 14, 2026 at 3:23=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> By running LTP stress test cases on VM, there is an RCU timeout issue on
> some vCPUs recently. The problem is that there is HW timer interrupt lost
> issue when injecting SIP0/IPI interrupt from KVM hypervisor, this problem
> is hidden because the KVM hypervisor will inject spurious timer interrupt
> if emulated timer is expired. In late the spurious timer interrupt is
> clear if old TI bit of ESTAT register is not set, so there will be RCU
> timeout issue with LTP stress test.
>
> This patch set fixes the HW timer interrupt lost issue, also this patch
> moves unconditional delay in timer interrupt clear scenery, which happens
> seldomly; mostly the timer interrupt bit is set when it expires.
>
> Bibo Mao (3):
>   LoongArch: KVM: Move AVEC interrupt injection in switch loop
>   LoongArch: KVM: Fix HW timer interrupt lost when inject interrupt from
>     software
>   LoongArch: KVM: Move unconditional delay in timer clear scenery
>
>  arch/loongarch/kvm/interrupt.c | 37 +++++++++++++++++++++++++---------
>  arch/loongarch/kvm/timer.c     | 16 +++++++++++++--
>  2 files changed, 41 insertions(+), 12 deletions(-)
>
>
> base-commit: d568788baab24875604c231f723dbb72387fb081
> --
> 2.39.3
>
>
