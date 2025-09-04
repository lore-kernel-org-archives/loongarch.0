Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AD81D6DA9
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 06:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756967139; cv=none; b=U9xuQHmcoBjA87TWk3LK9RWEUEBQAOfj2MnmjmRvQjqLXJnv8+TotCS0hPe06ANVkinQXbbczeJ4SwNqJO/EwdD426wn6pjn13PXGA7ARcnP26XOO12RESNkiIIgIR6HMXf9idgmC8zH84drTfJdEalwJNKQqW89Se/2ImJqNp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756967139; c=relaxed/simple;
	bh=OiyQg+RIct2VcV7DDl+1YPRlSTFJG6extkQc30EN9eE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ilo3dNl1Itk15T1da0DbiqlSJh6VLQMstnj2UvGhHdZeJXXSP5bTlZJ+kjIUaRNNoV8s/N9qMvwNxhT5Gj906Qi88k3Poz0QniufFi50lP71dKHSKn5o6lXwPyKLVMDHISKuYSCJGA7r9rvtpprdTZvdMLyXWaJxjRE6q6lec4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTDyjq3J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTDyjq3J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E819C4AF09
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 06:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756967139;
	bh=OiyQg+RIct2VcV7DDl+1YPRlSTFJG6extkQc30EN9eE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tTDyjq3JdIVLxtQmDTLKhtZFQhY5ZpPAWyuaGNg4HsT3tkkTzggq+ooI4yyb2N4ER
	 VWz+BoBXpPZOKOi27m0Qr4bAnA4b6RdGnUjf9iJqCXSdxx21+1OCRX4gByuvpjnUwb
	 FIgjt+NcvPHeU/lMRLispT2DkaiMQyU0JN1T9x7G5UZ9Kr51Os9P5k3HjDpXYK73JC
	 oIC3BwVJSuunFD9uX0QJ7srIh/um13Zd2HHw0YWmLUVAbzJYoPMOLgjmYkZjCFJumW
	 GMxDQvnpZopxpyM0QH7D419sBYA097IwWmKkMBFdx+73hrqS4EUg6k+Q/8Q+MYjfro
	 QJt8Mx2xChuMA==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6188b72b7caso796904a12.2
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 23:25:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWY/mhInn5J1unfdSzeEgG0kPkV1IHlPqHeNwm5wEK9E8jvSnDziYao/FdEMCTPGxKWSyb24yrjKLs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkSba03gDo2naBH08QI9PxKyVvwzWxADx9RXK9LvahMA6HWINy
	FX97sayin2Woe7A4g6drfi3GPex8g8EAzYiU8D9IGdPye5nPPVxyzR7sGbh1phgJpxHR1AYViLG
	306KDcHXQjACsewNXWgs4izIl6/m5yWM=
X-Google-Smtp-Source: AGHT+IEuSgUEojFL2lGX5tP7lxrB3EtHth4NYh/l+8QCJ5MmWsFTsME71131TAohVLCemezrMPb56TXZN5B5xjH98S8=
X-Received: by 2002:a17:907:6e8f:b0:b04:67f3:890f with SMTP id
 a640c23a62f3a-b0467f38cfdmr562352066b.33.1756967137680; Wed, 03 Sep 2025
 23:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250904042622.1291085-1-cuitao@kylinos.cn> <c70e595e-c1ab-2c8a-3f46-3862ecd6e0b8@loongson.cn>
In-Reply-To: <c70e595e-c1ab-2c8a-3f46-3862ecd6e0b8@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 4 Sep 2025 14:25:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7j=7RSsyNFkfT_t0GuhzNL1kX1XaWhk3uU=VqYWtRiow@mail.gmail.com>
X-Gm-Features: Ac12FXyz1ygNs0gFRYev90sVCFlGP3Iehi__0o2aVnlYycpoWG1QGUYC90zfJwg
Message-ID: <CAAhV-H7j=7RSsyNFkfT_t0GuhzNL1kX1XaWhk3uU=VqYWtRiow@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: KVM: remove unused returns.
To: Bibo Mao <maobibo@loongson.cn>
Cc: cuitao <cuitao@kylinos.cn>, zhaotianrui@loongson.cn, loongarch@lists.linux.dev, 
	kernel@xen0n.name, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 2:17=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrote=
:
>
>
>
> On 2025/9/4 =E4=B8=8B=E5=8D=8812:26, cuitao wrote:
> > The default branch has already handled all undefined cases,
> > so the final return statement is redundant.
> >
> > Signed-off-by: cuitao <cuitao@kylinos.cn>
> > ---
> >   arch/loongarch/kvm/exit.c | 4 +---
> >   1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
> > index 2ce41f93b2a4..e501867740b1 100644
> > --- a/arch/loongarch/kvm/exit.c
> > +++ b/arch/loongarch/kvm/exit.c
> > @@ -778,9 +778,7 @@ static long kvm_save_notify(struct kvm_vcpu *vcpu)
> >               return 0;
> >       default:
> >               return KVM_HCALL_INVALID_CODE;
> > -     };
> > -
> > -     return KVM_HCALL_INVALID_CODE;
> > +     }
> >   };
> >
> >   /*
> >
> Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Applied, thanks.

Huacai

>
>
