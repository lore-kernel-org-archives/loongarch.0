Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1181791ED
	for <loongarch@lists.linux.dev>; Sat, 31 Aug 2024 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725107842; cv=none; b=qT/1Hahsf8Gl6ZmTTTcYloLAdrCv80X+NSWLRpOpGebLjxCJKiuCtAjsktBPX2g+W1AxpQVbh9AVeovt1AMugZ6gXCE61DTBLSNtm7u0EJ62mRuifCWpfb35/PjB7b4H8y+5gULi9o3bqYo8DIF07vFBRai3WbZxEjw0PNhYKYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725107842; c=relaxed/simple;
	bh=Noby7El9z0c63e41wu6AhQcfLUuk4A1lf0hrYdgifns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJL7gfZZwxSPCfCOi/gUajvz1FdFwjDjCkKVc67x/FAaBumjRO1KzoT57unI2ACkgCxC5taP5sg72pu3pSm2q3j7rg9Nx+4pMOMRr8KB1nF/ug6oYsU3CUBpQ5WwqpF+By6gdNjj8Yj0Kwpiy0Cc2JyEEW7I5WHJUIG9iNJyZ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fA//wwn+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fA//wwn+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F593C4CEC0
	for <loongarch@lists.linux.dev>; Sat, 31 Aug 2024 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725107842;
	bh=Noby7El9z0c63e41wu6AhQcfLUuk4A1lf0hrYdgifns=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fA//wwn+sB7SCym7eddwh3+Fv1gfwYSRnlrrR2y5soCmAKWVYIdYjNhCmTQlMPJPn
	 TkhucRSJDINL3UFw4wZq3bdJYB/Ae4Sgv37SivAJ/oYI90IhMTDATck/I4/P3I5NVN
	 mFv61uUKD2Vxe8/2PwxM6cDrrKhwnfsV1VQSM1WvRp+U/WGhn+MkWlQ5pC3KViQbJu
	 v9OWTruS+OmHWm45/GYq8QjHU8u7xvndTzepaQxjrfR1iEZGBaVcWKDxwPsR3wAV+y
	 OJppyv5xBU4sEquspqngzJW6XwQRIFkb9hUx2p9sv7/r1Tz9fZH1kM6j23vESffzfz
	 eHKwqrBfXSY8g==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5a108354819so3497387a12.0
        for <loongarch@lists.linux.dev>; Sat, 31 Aug 2024 05:37:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNyEYZO6fT3nWd5WTyJNrPyQy9hiV6L0iqy09vyMW9dUXTFRrOydGc35e69ZpZJuXb/L6cmLc8qOs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnpkoXoONyWDV/WB4uQRUle6CRi9EzwhrQ/77kNsEEIsQGq7WC
	VrUcsfQZNV+PxDZEk8lEyDuu5jMC9NmldLQ3ZH1slPRdtm+Z0ZxWxGDE3RdFhFz1Jb0NKROVceN
	QOppjomgi7Esiuh3eo/1Zs+8I02g=
X-Google-Smtp-Source: AGHT+IFzorRshPsuDJ8XEzT9wq3sbRSknfWJS/lfjEMrPElt1JbMx7hESBdAu8CIv3grlpOZ228FUCX0BNuT7BOAG1I=
X-Received: by 2002:a05:6402:40c1:b0:5c2:17b7:5a7e with SMTP id
 4fb4d7f45d1cf-5c21ed9fcbcmr6622190a12.36.1725107841040; Sat, 31 Aug 2024
 05:37:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240831052157.13532-1-guanwentao@uniontech.com>
 <CAAhV-H7GptUdpKScV1AuZZm7w-F5oUXHRmaT9BFCZV4HuQExJg@mail.gmail.com>
 <tencent_3F6931DF7E765EB870FD970A@qq.com> <tencent_3A814C6056AE06E21CE86A92@qq.com>
In-Reply-To: <tencent_3A814C6056AE06E21CE86A92@qq.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 31 Aug 2024 20:37:09 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4wNc+747nZPzT714KzGRSnbye==WXdxckVG1nTxEfLjQ@mail.gmail.com>
Message-ID: <CAAhV-H4wNc+747nZPzT714KzGRSnbye==WXdxckVG1nTxEfLjQ@mail.gmail.com>
Subject: Re: [PATCH] Loongarch64: pci: fix memleak in pci_acpi_scan_root
To: Wentao Guan <guanwentao@uniontech.com>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch <loongarch@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, =?UTF-8?B?546L5pix5Yqb?= <wangyuli@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 31, 2024 at 4:36=E2=80=AFPM Wentao Guan <guanwentao@uniontech.c=
om> wrote:
>
> Hello Huacai:
>
> I found a mistake that my PATCH commit msg need change to "Loongarch: pci=
: fix memleak in pci_acpi_scan_root"
> Need to send patch v2?
No need.

Huacai
