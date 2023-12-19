Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D78C14A8C
	for <loongarch@lists.linux.dev>; Tue, 19 Dec 2023 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JM/8vVUo"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-da077db5145so2544112276.0
        for <loongarch@lists.linux.dev>; Tue, 19 Dec 2023 02:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702981028; x=1703585828; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwKtmUeXSXGux8LEEI/VvN8eUqwl+pKEHLAxCiqGfVM=;
        b=JM/8vVUo7ZLldIHQsI7SSv0hv6HhDcc7BLwYfpVs9RZ0d5mvbRIHTEFXteusWvZNFC
         irMN6QZIiGY04ZGg9KJY4tw8K3rVO1qWBE73niXeLBcTRh2trlcUzDkr3qN26IGEgnQE
         HwIvIIiInt6qvrJaqbLzepyWST6WF/WIhiNpRoFQp0LqkuBm875pz/7ZbYVzcdTDJaCQ
         pY6cK/x1KcWcW7P7D/8wDy0caWFhqqpAFl+SaE+zPmA7aZrREf9eLkjDn3+Du+5EDeTV
         JD3eY3z6JhcTCfGIs2mipPwoHF6do0RkWxeShQK98D76JvO8A3WcLV6OzLZfD5G8dWje
         xegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702981028; x=1703585828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwKtmUeXSXGux8LEEI/VvN8eUqwl+pKEHLAxCiqGfVM=;
        b=ZPCO6zJQN71QW5E2ZlnBTdqkMjMV+8eUAAmB41WgXtuSoHQb5uqnFmkjAk0OSaF2HK
         k0mZaqwfS3CafQ9m3iT8O2oJkpuiLa1OhYZrfyNTgtZjo3xHdX+mXldiQDk4FaHse3B1
         if14859KYhJ6UoMn/6wx7787QpCYRdORCQLMoTVGRa4qfdd1RnlcjyEIwKcmbAugeQhf
         1sFWzibHJ3zs7fEAikiQreWvyuwP4hsM4LXE1vgJrH3U6MUN6I1oaIRic2Zt7/aH8Yg8
         BoC2dnLbCFW6IqevOAcGUOcQWXWXnGhW6POU75xHJuQLHqtuH1CPL6iFUQeBDTgYePEl
         fAQQ==
X-Gm-Message-State: AOJu0Yy0AlWcyplEnRRAcRC8vofiv0HPD6HrjOFFExgNllmtdPeKfEQ+
	V58GzKZm45b4cihid3QqE7HRwpAYJsKJjFkLBPGUIHbMRmzgmI2bFBM=
X-Google-Smtp-Source: AGHT+IEGctgYKKVMu+YuriBCPXOw/L5KAOMG9wLTDWsxAOg5VUoNJUVa/HSTkhiV6wKe747NB9y5LX/zVTaLJh/49tc=
X-Received: by 2002:a5b:190:0:b0:dbd:8d9:15be with SMTP id r16-20020a5b0190000000b00dbd08d915bemr2752608ybl.85.1702981028230;
 Tue, 19 Dec 2023 02:17:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231219091405.39867-1-wangyao@lemote.com> <CAMj1kXEPdMBkne=ugR_j1Be8Aeh8jCA_ryHvh8rMA-c27i+RuA@mail.gmail.com>
 <CAPWE4_wydoTWHUYPmALp1oii+=ALVy_BTDUO_1wOo7XmkJ=cjA@mail.gmail.com>
 <CAMj1kXEL2nuVyNq1O=ytrCr3xh3tA6TU6kRFuk07H1EmneRTTg@mail.gmail.com>
 <CAMj1kXFqpJvH0ukOTufsLCTyCk1abct1kaPUV3JTaS6hMb75Og@mail.gmail.com>
 <CAMj1kXFFb3ksR=HCxiWpfhcjRcx-U=XE5LmZ2AMt9K110QpynQ@mail.gmail.com>
 <CAPWE4_wAa5uYEqkSRkJH+V57jNgjUZgFcrrjtRqRDECTCCASyQ@mail.gmail.com>
 <CAMj1kXHLApok+q99a_MSb6korFnV5qhS5fDL6MXhX9F2pSjBfw@mail.gmail.com> <CAMj1kXFq2a+34cPMmq6LP9VpZGrQV0QAGt0=a-r03wczCE+brg@mail.gmail.com>
In-Reply-To: <CAMj1kXFq2a+34cPMmq6LP9VpZGrQV0QAGt0=a-r03wczCE+brg@mail.gmail.com>
From: Ainux Wang <ainux.wang@gmail.com>
Date: Tue, 19 Dec 2023 18:16:31 +0800
Message-ID: <CAPWE4_xOvsJvKNvZHUf-uA_RvDvKL0iFajsGceyhWJu9q0pP+g@mail.gmail.com>
Subject: Re: [PATCH v2] efi/loongarch: Directly position the loaded image file
To: Ard Biesheuvel <ardb@kernel.org>
Cc: wangyao@lemote.com, chenhuacai@kernel.org, wangrui@loongson.cn, 
	linux-efi@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ard Biesheuvel <ardb@kernel.org> =E4=BA=8E2023=E5=B9=B412=E6=9C=8819=E6=97=
=A5=E5=91=A8=E4=BA=8C 18:11=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, 19 Dec 2023 at 11:08, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Tue, 19 Dec 2023 at 11:05, Ainux Wang <ainux.wang@gmail.com> wrote:
> > >
> > > Ard Biesheuvel <ardb@kernel.org> =E4=BA=8E2023=E5=B9=B412=E6=9C=8819=
=E6=97=A5=E5=91=A8=E4=BA=8C 17:35=E5=86=99=E9=81=93=EF=BC=9A
> > > >
> > > > On Tue, 19 Dec 2023 at 10:32, Ard Biesheuvel <ardb@kernel.org> wrot=
e:
> > > > >
> > > > ...
> > > > > I'll queue this up.
> > > > >
> > > >
> > > > This patch does not apply. What commit is it based on?
> > > >
> > >
> > > It based on the newest loongarch-next branch that based on the v6.7-r=
c6.
> > >
> > > Link:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loon=
gson.git/log/?h=3Dloongarch-next
> > >
> >
> > Please rebase it onto v6.7-rc6, notably, this patch:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git/commit/?h=
=3Durgent&id=3D271f2a4a9576b87ed1f8584909d6d270039e52ea
> >
> > which is now in mainline.
>
> Apologies, I got that the wrong way around.
>
> Merged now, thanks.

 It's all right.
