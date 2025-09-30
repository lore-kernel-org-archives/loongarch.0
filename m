Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B93626AA94
	for <loongarch@lists.linux.dev>; Tue, 30 Sep 2025 17:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759255136; cv=none; b=WiHbhfBMDOe50aMhpJvQZFPA511jhOc1QlrOe8d06riVPIb4IuNwPG7Ua51FWHYSYTzwAjS5E9cbqbp+nYSqCXoWEao0AjpbeU3FoOWKqyiSXN5A7tsTjZ+EtgsETX+8jlNGRUCRDoX8K68xHu3FnII95blFJhABDCCXPmKGxZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759255136; c=relaxed/simple;
	bh=Nejn7Jw0qE+Kkdg0YSBfXxO/oPYC6wySV3pVzrR08nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UtGaHbuFkc4cReUiTjZCtxIIG3jxtXM2ByhgPU5q4PR2YHFUyz470xDDZ8Wx4/rfuBw6uiZ+pgk7tMRcpf4vfLfpEdEMpBTQ9WUj9NDiPyVE0Ar/IEMLpi7PD2x0LJPs827RXRFW9BF8++LdG2hWTcQMSaRl+pUZvNUa75d1S0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Af7a0oos; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Af7a0oos"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759255133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F8cF4VzuVf+MX0Y5TLwWhlMcsr0VxyJ6vPdjbuar+xI=;
	b=Af7a0oos1cNQqnSoBPjy6BJIbfaIqPqj4dRznlnfUXt3VA4ITYEAgwH1AThkytQZUI/p34
	sMvLewXLI5rRWt/RSt/R4KuuozVKuU/o95sT27zBytn65E/feXj1DF/rfBd8y5Qx08ExKB
	0AwC0XixIX7uBumkTcP2ZTD9vQInyoY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-qZgyNstSM-Ko4NicWf-sTw-1; Tue, 30 Sep 2025 13:58:52 -0400
X-MC-Unique: qZgyNstSM-Ko4NicWf-sTw-1
X-Mimecast-MFC-AGG-ID: qZgyNstSM-Ko4NicWf-sTw_1759255130
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-46e38bd6680so21325645e9.1
        for <loongarch@lists.linux.dev>; Tue, 30 Sep 2025 10:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759255129; x=1759859929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8cF4VzuVf+MX0Y5TLwWhlMcsr0VxyJ6vPdjbuar+xI=;
        b=Ag46TJn8TpFnckrOWoGewCDaqWD/tafTl8DX9WGJID5IKDSaBTiYpe8NrKglwyzdUe
         +/LJyBKn4RUveJgV87qftNCvQqnWSofI4LvAwVsGs1SBphy/IRe8PhBm95/5L8fGXV3V
         vg024FCQSxlNI76wqMvBzPDNb70bIw9x0zK3oGJTMlKQm1n5aajyTY12JQ6bjr54phMc
         WjH49TBgHOKQq8baW4J7AIIAv1UQ1t5Gvs5eG5rc0k1eJklj6m/ZNE6NBIDH5IDmwTjK
         QiU0L54vQsoEv+xMU8rWxDin2NKXkA4wn2boxZpeIQcFNE8LHjZHj3hysSNQW0oR4mo6
         Qm1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYTPGrzjmV4Mxy53S0o80W0s0gFe/ynbVEp1jFXORxCH5NEOeZoP8evjo1T4GTsiSPqllx69QsRmo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw5T0Zupdxj8JrBOwxS992wUcWvsABZuJ4/OxHK7ajfD3YKKaE
	JxQaRzuAH7urGaAFZoLq4qgCvTi13lMe3twjYcKeap4YUd0nmr5yfq5Jop5sK2MGrcRBxg/iCLe
	3hfeV6zPNfM2cGOFGuvZW3m9VSL9TFSTrgkipuOrpGxBwm60rTji349s4riO6pVCXQXHN5FcdyA
	9gdKRHLcipnmYKd4arJuKLDjFNrEcm80M55i4e
X-Gm-Gg: ASbGncvaZyhciN6gLcmDmQSMLBjJ9vj3ouXZJiqNslCDv7jAxhl0mw40ewOTSGiE1Jn
	A8y9ysSlPgrVWyKluBPZA5JkYVgnheThhNi3XyqpJs8slU6CrZ+H5Mkf7yNdKLZE4PNPR226E0q
	1oSko31Ibj7i8uh6Ek2VXzEEMaMuCqdNbr3Rj+8zOSN4AmqE3FKYlnTvE0+n74N581EPH2mtABx
	TnKA7JTJiZ18CcCNJBpzZ/Ukb8ZLC52
X-Received: by 2002:a05:600c:5303:b0:46e:4287:a85e with SMTP id 5b1f17b1804b1-46e612192ecmr6607315e9.13.1759255129630;
        Tue, 30 Sep 2025 10:58:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGX2ydmCLO7e7qdwMiaI77CR0x1R/qx+ietFiVLOLU40Tb+lvt9g/R/AsWRQlZ5JMQ4XFB+rlRpfSE5Yr1lgI=
X-Received: by 2002:a05:600c:5303:b0:46e:4287:a85e with SMTP id
 5b1f17b1804b1-46e612192ecmr6607135e9.13.1759255129262; Tue, 30 Sep 2025
 10:58:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250924081305.3068787-1-chenhuacai@loongson.cn> <CABgObfZvdkAR6YGx7HKT+aVaE06w=FG7Jus=3B6nxadDiv5c_Q@mail.gmail.com>
In-Reply-To: <CABgObfZvdkAR6YGx7HKT+aVaE06w=FG7Jus=3B6nxadDiv5c_Q@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 30 Sep 2025 19:58:37 +0200
X-Gm-Features: AS18NWCD5Cu1BM-gCbaA5ScKHErZkLAW39Qw6t4H90yeM5txDIxnZuzOmIqqkbo
Message-ID: <CABgObfaPEMTGYSSZp_5S8J67+=GdkxmwNuRMHVfV37iCQex7bg@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch KVM changes for v6.18
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qix_l61MlXnC-XfhPFfvJvDxIT3kJ2gAGgsnwIM0bDY_1759255130
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 7:16=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> On Wed, Sep 24, 2025 at 10:15=E2=80=AFAM Huacai Chen <chenhuacai@loongson=
.cn> wrote:
> >
> > The following changes since commit 07e27ad16399afcd693be20211b0dfae63e0=
615f:
> >
> >   Linux 6.17-rc7 (2025-09-21 15:08:52 -0700)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongs=
on.git tags/loongarch-kvm-6.18
> >
> > for you to fetch changes up to 66e2d96b1c5875122bfb94239989d832ccf51477=
:
> >
> >   LoongArch: KVM: Move kvm_iocsr tracepoint out of generic code (2025-0=
9-23 23:37:26 +0800)
>
> Pulled, thanks.

Forgot to mention, please pick one between chenhuacai@loongson.cn and
chenhuacai@kernel.org and use it for both the committer and the
Signed-off-by line. :)

Paolo

