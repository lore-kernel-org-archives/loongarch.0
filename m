Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB21C76026
	for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 01:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757640142; cv=none; b=CSpDkAirprWB2CD3Y0++TCuVH/Q1jLNF1a4+p3LQ+VRsS1u+JAiSO+vCWuyDTfOcP0nokA+8AKrr4jEqh44LdpkjR8bvJOrFOJPrrObcEjVCKv4ekD0ICz9ODEUstoP7TbORfvckrWdBTzVVRg36p0mgZHB8iy+zzSkPPp6nHFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757640142; c=relaxed/simple;
	bh=OWs8kXFb2L4DqgQPMylpV2TV1VfDwdy8OxC6W+nA+hI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BT4IaB3rIvWm11GPw51xd8ujPo/PWSVIwDS2Oc1/OP+vADkzbbkILOEa/oP03XKn6bZiCNrSRx5OzqMFXfJNGNxOGAkomWhOSXv4FGac6wYSFEWaYb6z8C9dQrDDD+SS2nrtrv3NM3dv1+0rQxpWfdWi/ev40j42gBn6EozOMRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiGGG+L5; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiGGG+L5"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b02c719a117so235213066b.1
        for <loongarch@lists.linux.dev>; Thu, 11 Sep 2025 18:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757640139; x=1758244939; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqEJRFTqkXTHPxe+anHjP+6b7P+oYHlI0fjlwqZC7wk=;
        b=OiGGG+L58BNuyaP6JNXPwwkjsF778xlccEs3yNOq3jtr3BC/H0ZbGsLTdtG/93pX0X
         BHiMwtyGvX7cOW76l5NheD0XbtbFy/+Lqt7BNW9qNYP0X0TMp+uteQW7E2t9QoHXrywq
         sBlQw06lgOLNfAPcocTmM8OEIDmBm9TJKTOlz6LP5WCaGwx7VO2zKvTtzhmxCph2Jkxe
         MqJx+jsMqk140bVLghd0VK9n8rlJz38cIrwY/VXA+/PrJFde3M6PDLujU/NDu2ehlysM
         xAFEqV+YZsRrL7WGYi3bY2ufnEsv3wNHsnQPsOLgIuYD0tsQLhmzdElvyvPOkuWTuxkr
         rR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757640139; x=1758244939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqEJRFTqkXTHPxe+anHjP+6b7P+oYHlI0fjlwqZC7wk=;
        b=nO74D0EJnd71mOQc0JCg2ryd+N6sN6yLB/bwo1acy4jO+JLz935aN+AnPwNuAE20LE
         /jyG1aGQz72cyXD50DSkFGKosloQlVbTtd5/qAwFHx838SCiFJUsVW0xqlB8FvdTx7Nc
         zcSnGy8bTN8glhReamTvNSa5kR0KMf3fxfld5Luo9Luj19PIGzsAiLQvvEdrdp1edLmb
         oDEGKPfShnh8okhICd2cIg9pE9rDZntDF782JTFrbMq8HHHveNtTS5UGUyqhqd50uYCs
         4Xn3tTkdnBvPABT5PwxvmyynfyXAROLcbIBKMF1+P+jHoOISXlKa2XsLL3OizXqJN1Ok
         yYxw==
X-Forwarded-Encrypted: i=1; AJvYcCVENeBZa91Yewm+PXi9buRn3iRrydR2nc1xtBC3cmJ/tYF7O+Xd9KPiy62B2ofrFC84+Teqk3bk0So=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkueD2+5eV3f7CoKWiwPC9GhyyiKvoDjFP+qbi2TwOjlK7dc8w
	HWqS0cUkET2NC6z6yQYMfwegyRchXxCVzveYHPnJOlePn5rkyaF/y2elmhyA5sUufNHzbUzipJV
	oRqK0MEKY577KwbF1wkQ2X9loyS2Qp4E=
X-Gm-Gg: ASbGnctbEsLSbaED/YQLgWFX/hEbPjw2RCFi9pT0IUubYBMWpWWXcI13ftN0dGsk6XN
	nDPNOBZFfZXMdKUmLuBSOpfhgXvQorvvTobSOc8PPm8Xz2QqVlfpBJDqOUh8eZBGbjL3mwWCLJQ
	0pdELScJCM8SREEqucpZxOU6hetmNrkjdl+BA9PmnJF1nWD/N/KtHyEU+mD4kGWUF3q9ScGmSbM
	S4vL/0MdDZzcZH3RQ==
X-Google-Smtp-Source: AGHT+IGt/CLEu8nR5Ze+5xkikkjJ2cYfz+ATtY+dq2NhWYwDAqW/E0WWlDo1nJkUnD4bsOlbYioLZpU2LK1U54XCsZI=
X-Received: by 2002:a17:907:1c1d:b0:afe:9f26:5819 with SMTP id
 a640c23a62f3a-b07c35cd754mr106362266b.28.1757640138949; Thu, 11 Sep 2025
 18:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1756987761.git.zhoubinbin@loongson.cn> <175760122164.1552180.16853979882678693472.b4-ty@kernel.org>
In-Reply-To: <175760122164.1552180.16853979882678693472.b4-ty@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 12 Sep 2025 09:22:06 +0800
X-Gm-Features: AS18NWAv152H9tlVnEaqIuU7dXqcdClzdZ--91I9sBvedtXMJlWCJzVaZLWxQLM
Message-ID: <CAMpQs4JbQU3D-Bs2687BXSC=FKJBS6RMvWAKb6AJEtzit6hWqw@mail.gmail.com>
Subject: Re: (subset) [PATCH v11 0/3] LoongArch: Add Loongson-2K BMC support
To: Lee Jones <lee@kernel.org>
Cc: Corey Minyard <minyard@acm.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	jeffbai@aosc.io, kexybiscuit@aosc.io, wangyao@lemote.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee:

On Thu, Sep 11, 2025 at 10:33=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Thu, 04 Sep 2025 20:35:04 +0800, Binbin Zhou wrote:
> > This patchset introduces the Loongson-2K BMC.
> >
> > It is a PCIe device present on servers similar to the Loongson-3 CPUs.
> > And it is a multifunctional device (MFD), such as display as a sub-func=
tion
> > of it.
> >
> > For IPMI, according to the existing design, we use software simulation =
to
> > implement the KCS interface registers: Stauts/Command/Data_Out/Data_In.
> >
> > [...]
>
> Applied, thanks!
>
> [1/3] mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
>       commit: 67c2639e1fc1a07b45d216af659c0dd92a370c68
> [2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function support
>       commit: 2364ccc827e44064e9763f2ae2d1dcc5f945fdf3

Thanks for acknowledging my patchset.

I can't confirm why you didn't apply the IPMI patch, but this appears
to break the patchset's integrity, potentially causing missing Kconfig
dependencies (IPMI_LS2K select MFD_LS2K_BMC_CORE).

Additionally, as Corey previously explained[1], this patch can be
applied through your side.

[1]: https://lore.kernel.org/all/aFVtNAY4u2gDiLDS@mail.minyard.net/

>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
>

--
Thanks.
Binbin
