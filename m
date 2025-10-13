Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0273093DE
	for <loongarch@lists.linux.dev>; Mon, 13 Oct 2025 20:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760387564; cv=none; b=d8Vh/XopwNswaEBI/kd5nExIRl+OraAi10f+OJkLZkzRsQDSB/VbrCYwWZour7Q/Of+0LUQBX9omHsxt0EvEbULsdxeRsNxpQdPTtVw3rwLP7RC3DiR+DlAPo2VVaOIXxPAWeaGFV/T4lwIRPOkBl+yjsrebtJyOAdba/voK0z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760387564; c=relaxed/simple;
	bh=EQamDqz1jKPoQmI1VU+7+EDF4P83/GJiuJy793deQ/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UKewHkINYKD+MO9jIDUAM3T7o4vdGsMn+n6O95mDaVjnpUdCbZMsDS122Ybg/vvsByeD9x3xTe2n4a7ypElimB66yd3a9XsLO/CxZ04+lTnXvfnXRu92rKxO2n80fT1Y7lNYvbrGGlLj+aLgxFTscXrVpUNAznYx5cJAeB/AR+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXNLIEIO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXNLIEIO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09CCC116C6
	for <loongarch@lists.linux.dev>; Mon, 13 Oct 2025 20:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760387563;
	bh=EQamDqz1jKPoQmI1VU+7+EDF4P83/GJiuJy793deQ/E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fXNLIEIO0pQRD69bsDu12VX+Yjcwcamqc01kAyQjPpYK6mMlb/GuoW9dgyxiPga/l
	 406HhYMy+CdzVvI56t4rLOrZO/oryEepB4xx7z9dphUz/V6VvocnJLA0vNRKe78qYb
	 ppgJ/n8TbzQmsLjjwfABAWDDqQ1ugvf9S4PgtIAmJjpUk57/CuQdLBRpzyVeiBkXfu
	 l3JltVJyVCp4lqOiBTTOTG5qt/yRcN+RuDC/AtZY1e9XpGdwYLogR4ankQzCa/P8bM
	 uaJdgVlnSmDZz3sqUfOpGjMjlTP84/2PKoSsgUurZ4cxZ1/rCvUpA3RgmwNJHQfHFM
	 hHdC2gYN9FH3w==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57e36125e8aso1074990e87.2
        for <loongarch@lists.linux.dev>; Mon, 13 Oct 2025 13:32:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmyA+tHdPwVkDNqHyeOBKeLt6EoS6LeP2gc/vY/vG2+TuAbwdWMPEKnDOyW1hR9sAzxMP6hoRfqCg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2Ut82nRYbKYQ9LIfF7eZqQtVtfBFwAuF2ExvJGdt4AbFJiU/M
	tlFoUx2x8aO7F2s/uu8a45llWa4zoT8cnppkHUbLalUudPbXIWtPDU+77fFj5OclfhVCS4FTEXU
	QdsL7gcloPL4ycutTQ6YJzt/RTL+k/rw++BdRcjpk
X-Google-Smtp-Source: AGHT+IFm/qhJPRKGc+a+TWhUwJHmseKnmX3UsC7EjJHnIC1kG1AUHBMR9nLxzbY5e9K0EIzQFCLgbzgnfLD4YXcOdbY=
X-Received: by 2002:a05:6512:3045:b0:58b:23e:253 with SMTP id
 2adb3069b0e04-5906db04028mr6538684e87.7.1760387562236; Mon, 13 Oct 2025
 13:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251013-getcpu_cache-v2-1-880fbfa3b7cc@linutronix.de>
 <e95dc212-6fd3-43e3-aeb7-bf55917e0cd4@intel.com> <CALCETrV2W3cZEJ2yy7F-F9=e_8HLP84ZWrOJCzUYn_ASb0+M6A@mail.gmail.com>
 <494caf29-8755-4bc6-a2c3-b9d0b3e9b78d@zytor.com>
In-Reply-To: <494caf29-8755-4bc6-a2c3-b9d0b3e9b78d@zytor.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 13 Oct 2025 13:32:30 -0700
X-Gmail-Original-Message-ID: <CALCETrVuW_MmksnkprK5Ljm-5RBSS=FUA8R8fgGMhZ3BxW15Sw@mail.gmail.com>
X-Gm-Features: AS18NWDkjUWHXDVipeI6h9oFzsXdlHdU2eK-6BrfttbpUi-mL82DSNY6ulu9J34
Message-ID: <CALCETrVuW_MmksnkprK5Ljm-5RBSS=FUA8R8fgGMhZ3BxW15Sw@mail.gmail.com>
Subject: Re: [PATCH v2] vdso: Remove struct getcpu_cache
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andy Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@intel.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Shuah Khan <shuah@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-api@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 12:45=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wro=
te:
>
> On 2025-10-13 10:14, Andy Lutomirski wrote:
> >
> > I don't actually remember whether the kernel ever used this.  It's
> > possible that there are ancient kernels where passing a wild, non-null
> > pointer would blow up.  But it's certainly safe to pass null, and it's
> > certainly safe for the kernel to ignore the parameter.
> >
>
> One could imagine an architecture which would have to execute an actual s=
ystem
> call wanting to use this, but on x86 it is pointless -- even the LSL tric=
k is
> much faster than a system call, and once you account for whatever hassle =
you
> would have to deal with do make the cache make sense (probably having a g=
lobal
> generation number and/or a timestamp to expire it) it well and truly make=
s no
> sense.

The global timestamp would just be some field in the vvar area, which
we have plenty of anyway.

But I agree, accelerating getcpu is pointless.  In any case, anything
that historically thought it really really wanted accelerated getcpu
can, and probably does, use rseq these days.

--Andy
