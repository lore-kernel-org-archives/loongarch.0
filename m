Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B943E28FE
	for <loongarch@lists.linux.dev>; Thu, 26 Oct 2023 02:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eW6iceni"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330AFC433C8
	for <loongarch@lists.linux.dev>; Thu, 26 Oct 2023 02:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698287812;
	bh=LBVZhaeW6URQlbztVArsjMfHnEivxm0gNeW9b+4uxUY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eW6iceniXu3Ffgu1UweUFktui6RyVIq7qDzoKXTlM2TitHXFMMgJ3fkZ9GtwDaVtz
	 FvJPfqDZns+dlSfcwy6MFjZoOw2d4ZaNr/lu3MnFNqVxJIiaeoPwa3FDX/KtXvbGNb
	 Y059piHI5naPI/WGQ6F09KlJOvG+C76w2Kyb/83NS8pFBHSTYM8KS4iETbD5Mnu1YQ
	 y651QPEi5iQGUE3YIj0bjcdqkITS7AC0P9Hu/BlZTUfHNvgV/hYxZX9k/2w390tl1C
	 kGs+3Bg+Gd0M+FzkEiD0pqVrkMH+LrprxF1yJomT95VpswLdr7FnF16K5Vr7mEl2Fy
	 iCS0Bs6TqjpFQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-507c91582fdso528061e87.2
        for <loongarch@lists.linux.dev>; Wed, 25 Oct 2023 19:36:52 -0700 (PDT)
X-Gm-Message-State: AOJu0YxWwelNMyxxnG9B1g8brkKWtorKJl5XGZeqjiOMAGPpXoSQExMC
	sIqRx8yeHAmd7D/uI4l9cOniqQH35gmLfouh7w8=
X-Google-Smtp-Source: AGHT+IEJm64k8zz1qwwSZBzF8xmGdZN3VVlcqXMTYBwBwJ955QK5mEmGWCA+iioc4r1gJ31+xvfExuA7ByJgMKvT+ag=
X-Received: by 2002:ac2:5edb:0:b0:4ff:ae42:19e2 with SMTP id
 d27-20020ac25edb000000b004ffae4219e2mr12246988lfq.58.1698287810378; Wed, 25
 Oct 2023 19:36:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231005091825.3207300-1-chenhuacai@loongson.cn>
 <CAAhV-H7VN_r-SzEMK6LHqXzVbNemZYuYYLb2mri=EGZ7qb3C3A@mail.gmail.com> <791d3b77-8a4d-4c5e-88db-f38843d37098@redhat.com>
In-Reply-To: <791d3b77-8a4d-4c5e-88db-f38843d37098@redhat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 26 Oct 2023 10:36:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7vuFhcOf7SaJ1C9Jv6E0LjYkY_TzKSRCXCDTag1f+OEQ@mail.gmail.com>
Message-ID: <CAAhV-H7vuFhcOf7SaJ1C9Jv6E0LjYkY_TzKSRCXCDTag1f+OEQ@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch KVM changes for v6.7
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 7:54=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> On 10/25/23 04:10, Huacai Chen wrote:
> > Hi, Paolo, Excuse me, but this is just a gentle reminder. The 6.7 merge
> > window is coming soon, have you missed this PR mail? Or should I rebase
> > to 6.6-rc7 to send a new PR (a randconfig build error is fixed in 6.6-r=
c7)?
>
> Hi,
>
> I am expecting some changes to Kconfig for 6.7 and wanted to pull this
> second, to solve the conflicts.
>
> There is no need to rebase, but it would be useful to point me to the
> fix in 6.6-rc7.
OK, thanks. And the commit 449c2756c2323c9e32b2a2fa9 ("LoongArch:
Export symbol invalid_pud_table for modules building") fixes the
randconfig build error.

Huacai

>
> Paolo
>
