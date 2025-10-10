Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B463E1553A3
	for <loongarch@lists.linux.dev>; Fri, 10 Oct 2025 02:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760064526; cv=none; b=NyVOu8+/HNdQDUwcEx9J1rtvpr1hWQPrbwBWWRP/FjEA0mjlCPFDSYuT2ROdWy1MobMdgTwOql6t5tCbH9g0eHt/j1v+A96Dzv9NtsVpiTlxDHTfwMnpJdHVLFHVOCm+LLSRN4POTjJ2nwPMMp3F4SFQOI8WfyUHN5zp2wAYLvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760064526; c=relaxed/simple;
	bh=SUvjTYrAKggs3w1tKlxCJydt04WX0hyij5ZVnNtO2rY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KvLA2AxYANtCtfTuNROZBbFOSccf47ybZIXuhnCz5gKBOgeTXjMFqCHM14nHdDHx7vxpkhnl5ckQVVrQQg/ncKk+15we8APlvSZ98nlB8JkZXUvtsTUcH5EhFyBDO7y+6vPvG4PNf6NUwX7YUj5NFWA1esMoTS4z6UR3SJLAbpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5nVd1iN; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5nVd1iN"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-743ba48eb71so34881237b3.1
        for <loongarch@lists.linux.dev>; Thu, 09 Oct 2025 19:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760064523; x=1760669323; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUvjTYrAKggs3w1tKlxCJydt04WX0hyij5ZVnNtO2rY=;
        b=a5nVd1iNcxw4GoYysw7nA8zDAjakVwYeqT3D3ebRyjQBdC2x054dmBsKKNFzGXs+B1
         SpZjh77EspaELzDR9pqgxgw0RsWtLRVc4AKaN3bsjnDHUvx09w2jnBsmx05eFVOxs+lY
         V207gQzgGurcYCWYVg6rmdQXMe/U8pCeOq/JfBHH2bKbqHdSw2yRDcP8iXncmK7327XO
         DZrMaVfMovn9NCG9xvplsPboK3Yz0bE4K+brEgZWm2GncY7yhcYRTHkJTXArcKYBIoNf
         qr+WxDOuHdFxGdLIxhtp9INvXTIGu5urEFNCWNWa0BYhnhZCxer6CmzRahWwgugKRCDi
         pjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064523; x=1760669323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUvjTYrAKggs3w1tKlxCJydt04WX0hyij5ZVnNtO2rY=;
        b=i+d9DPLrLNLGcSW50xSQjsbtgStbGTbpIabBHElI4GxgJeHRUueLElDc7g5bU+b8LJ
         gzeijMz+ikvHX7a5+UxTDU01Gd0sDWPu1wbPIDvTGR/vnnUOJzF7yk6iSDoX6qRFoyZU
         11KwkVQork5rjaM1A05LgG+qoPWaY+eJgeZ6FTtkXvjRrt5pdXDYb/X3uMhXSKFzWJQ5
         Kj9gtCAF9Yinz4WRxxwUPELBBWplHmdYa4VDuQ+SNMShwEk2kmPHb4aZw1KSbf0uF2Tr
         ot5HYIwvAjhcQ0tL+Mjvoq/Mi1qsDE7IYgEZJyfy+Ey9TN2CsMXpXrvDKoCkiv5z4GoO
         S9Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXJFXCJU4rDrILBpmJLEeaMODrfqMltPAVFlUtibqF/idhJRcBrLw+idK4rbwT2G0Cj4zQEGIqIV1k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6HaydAoMJ8qYsEjCUtYPquoibzcsNuQ6N2nSUSir8fHQOwx1Y
	N4Q4gz8dQCmSqB0MLVBQLtXy0k0Vi8eFXiCRB4DeTLSs2Td1JBSbWXAIFRA5c3lwNF6ar3EaAXz
	soxQ6+FXozadcgXkCi08OojjBP1vUELo=
X-Gm-Gg: ASbGnctI1PUZqDwQvie+iPBa/TFo5DsTs5Se7SJxz6Vc4MnApXd4ZlyQQAFDfZ/chvp
	Cnzb928HogsioRK1wUtgUtluil/O++5/LyNltDKaI/gnWRVfMmogvZqHS3fM0r9p2x/9u5/lgwx
	QQaWI1/CmDXy2PgndUKhI9s50S+vZIykne8B1hQgznbo+Vdp8+KSDUoUtW+1YhDdMs7g/azoBQj
	O8wbo/7s29tzM9Vp6RbYl0q/LraA8IW1Kr3PRmi6A==
X-Google-Smtp-Source: AGHT+IE/ruZR0Nl+gZjd7KSfaZ+4Yt5azf8Eoz6teA2EZ5XcCIQ6BBXF8AxOCZshaSTrV+l7WDzDAJYCcqNIJ+IMELc=
X-Received: by 2002:a53:cd0e:0:b0:635:4ed0:571e with SMTP id
 956f58d0204a3-63ccc4fd4b5mr7697871d50.22.1760064522649; Thu, 09 Oct 2025
 19:48:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-22-safinaskar@gmail.com>
 <a079375f-38c2-4f38-b2be-57737084fde8@kernel.org>
In-Reply-To: <a079375f-38c2-4f38-b2be-57737084fde8@kernel.org>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 05:48:06 +0300
X-Gm-Features: AS18NWC-iakvkxLfUlO1LRxakg0fg4KV7Trw_hsIF2wxGpnmpWZvHTCQ7Z3GaoE
Message-ID: <CAPnZJGDK08eDWaMTmvVQwkAAThUvgB0XgAapqqV4_ZmWeay-iw@mail.gmail.com>
Subject: Re: [PATCH RESEND 21/62] init: remove all mentions of root=/dev/ram*
To: Krzysztof Kozlowski <krzk@kernel.org>
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

On Sun, Sep 14, 2025 at 1:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> Please wrap commit message according to Linux coding style / submission
I will do this for v2

> To me your patchset is way too big bomb, too difficult to review. You
v2 will be small.

--
Askar Safin
