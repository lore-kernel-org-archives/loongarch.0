Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CF2246774
	for <loongarch@lists.linux.dev>; Fri, 10 Oct 2025 03:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760066302; cv=none; b=GX7r7WP4vvWLahoRdIoiagruFknE34BZAPofmxbq4dYzdIdUYVRm3S1xK2k8vn9agWzXzdIPToSoIcmuA3tYZcrhBDPQ5vWgRvLlf5J9dVliqyWqrSDdAimmA/te5EioyyQxlP+L8++FZl1TBRSkXQuY/7tmrniEgUiKX9vgzB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760066302; c=relaxed/simple;
	bh=Pa2OhCNI6n3Mf2P8BAMZLHp7akXwtALOTxVawJZtfK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESf+osgse2D/MPKdYACw/cm65ISOUVZ6va0Kn81/2hA/QQRC2YK6n22P9g1iAVl4PKlrs1W5U/K8CxBq62j7Z9wb75ORKbidznFeHAfC9sUu3KTEep8tVP0nStIK1dd8XOcuhgM14Q6817mZ0Bth6H/iBVvrQn2a+sVtRKk68HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuPFJRAr; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuPFJRAr"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6352c8b683eso1884897d50.2
        for <loongarch@lists.linux.dev>; Thu, 09 Oct 2025 20:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760066297; x=1760671097; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pa2OhCNI6n3Mf2P8BAMZLHp7akXwtALOTxVawJZtfK8=;
        b=VuPFJRArITzhj+MrMPl1Kq2LVdWE0gfm0PncJ6jX5tq5wC/aRfBAmzies+25IgY71o
         2Z5xwFnyHGpgKx9MjP1YqKxScm/oMTnccNKgo6cP7zcVS4qsjNet/92fIoGpQ6TzfU1+
         ukey5FF+zNCyF+SID+r1n5md80tyw74CdAxBgaigE5Qm7Xcn1t3KomiEeKeryI/UJuW1
         pDlBpxmSw2O47cdorUvGl2uMn+xxJQ3A74nFswaW+IRHLl/lYPJBtJ6YW3VJzq3iSwnk
         EVntPzJ/vkLuIfivGD2JU38wYRVgWATBckj/DppEAI0vJIiYv7tkN8dbiK2vh50iu5dq
         lXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760066297; x=1760671097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pa2OhCNI6n3Mf2P8BAMZLHp7akXwtALOTxVawJZtfK8=;
        b=G8FYMzzZSyPCE9mOm+BMviAu0GtwgWCTPGtkO82XKZ+GDo3TZs/OX/krUzAbMwuOGe
         T9xVl1D5r0H2ukjtPndPNu1TMoSZ66JDhtRHKRe9zKWZuHs0ex5l+fQy9N5vPB4IUW6W
         q08elDgk+s0DJP3nRKag9FJiCfJdDQSauGMo1RVXMptIxzPp0wYvas0r9geo13Z1ULTz
         7B3sLQU/KBhFxoViM5S8tgB9wtniEvXb4eKqbq+8uhJYpN4xFMkC6mKIsJMpW2X+VOXd
         jWcDaiLplvtx09th1eANsUX6Mq/gJ3r0uE0i2DlEpCtcrqv1PgBonOwpCyPXOlPvGDqV
         IL8A==
X-Forwarded-Encrypted: i=1; AJvYcCXAPpXpuwwpUzbHqq/vUuyjnezC4/L1pHs647IZxHMeSjhECmdHQjpznOehVMrp5nPFJ6e6lGCC4SY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEGjIY+GALVNe4gKQ3JtdhFMJkof2dPvSidCft1ucRQibLRTGT
	Rbrj0WGRmORoYSazpEZpm4MXYSsADZXfSxcWpKfjB1l8N2QmRfZtUFnVR4Vh902djh5eh87Lnmr
	Qfk55px+rYK3lF5TtwGfsthu0PNhkqg0=
X-Gm-Gg: ASbGncuccfnlqzS09F2FncBnDr6KLlaHZyADRMPjpyghMtsRqAbNCviKdXwfq1CEpMu
	yU0u0kvNKZkPBMpAGBOemDDdFmf7wqszhINGcUjHZ2TiraQcaxCxLt5056EK8q7RYRoPl0Tlxye
	QXulXZ56FLM65INdQDMwF0HogyCsNHgnUnQKeGHzKYlZvYsd+OOiZIFKuZPkPd2n/c05xmqigW/
	8+nkcsJvan+eNx1mnRY5soyHQ==
X-Google-Smtp-Source: AGHT+IFTQdXvlZxDoBIwCyChBgf2ijvKjPOXu3xyloDy3VewP6H31eXx2tdJ5Y2sZs04pWqa6kN09Zh4TAMeP3pYKTk=
X-Received: by 2002:a05:690e:1587:10b0:63c:e90c:a6d8 with SMTP id
 956f58d0204a3-63ce90cac96mr2654086d50.44.1760066297220; Thu, 09 Oct 2025
 20:18:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-3-safinaskar@gmail.com>
 <053f39a9-06dc-4fbd-ad1b-325f9d3f3f66@csgroup.eu>
In-Reply-To: <053f39a9-06dc-4fbd-ad1b-325f9d3f3f66@csgroup.eu>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 06:17:41 +0300
X-Gm-Features: AS18NWCm5nh3vfq5EIpD-J_OKHQvi_8uVbgLjcXTz6TnQl9pdn9vqNDRLNkppRk
Message-ID: <CAPnZJGC9avy1s=xFS5Tg6obS+RB3zw4yWsUBw9g=Vt09S6j88w@mail.gmail.com>
Subject: Re: [PATCH RESEND 02/62] init: remove deprecated "prompt_ramdisk"
 command line parameter, which does nothing
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 2:16=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Squash patch 1 and patch 2 together and say this is cleanup of two
> options deprecated by commit c8376994c86c ("initrd: remove support for
> multiple floppies") with the documentation by commit 6b99e6e6aa62
> ("Documentation/admin-guide: blockdev/ramdisk: remove use of "rdev"")

Will do in v2.

--=20
Askar Safin
