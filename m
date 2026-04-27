Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8270437CD50
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 21:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326370; cv=none; b=dB5yihezmIMXKCfat8U1V1aTYd01WU2fk0lyUIqMe62IjjHcuss3fT8Svc70Sn/zsGOLCM/9ABFFw/glh+cOLnbCzg8qiKwxjTcv5xYCwXhy43jBFjizwZ4/kLlHA+48pJAnoLp2gK2dgX25Nn3uQATsokbZiVjW+RytdWhEDrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326370; c=relaxed/simple;
	bh=i/k46YQbNxc6jmDhpSrBTZQploRe2hY24KQV/uGHVj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xci3Vi1y9NvE5V3aP8rscYDwqMU2qNR8CdhNVehhw1+eOCjRxeaJDZNq+xmiL8vR00TNq+Pf8T7YwILSCX9ofS0+mo268EuxDbkYkuFsIuCqf5n3o2uVgMCEX8rgEgbqd2TIPBYaQNxMH4vCIKW6dA/JIER026b/ZN6dCmC09Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=b20682R2; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="b20682R2"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9c01854477so696672466b.0
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 14:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777326368; x=1777931168; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=b20682R2J8lBP6R4fYw7A2YLrqd4ecurjjvSq6F+G5fbkjHerieFss3EobkkAOG8L1
         Q03b+nQ/QmIJWIXCJlDnPxqzNsPVh6/zZ6wtL72qOF1gZtJe3ZVi46J9u3Z/SUAH2m8Q
         w3vAvfNB3twaIiCNOVdGDCBB0tJu4Rok1H8Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326368; x=1777931168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=KQTNa/t8oslY9HfZgN87Mj8K+xKPgXhcX7LtX5ZT6SLLqU4E+aesibp2bfw3+hvztF
         YOtaNLA7sWRL/RDn74erKLtnhElmI964ob4D2SjgcncmKgCAp1DLPMxCIFvLzZZv5lHo
         G/n2N9tUf8n1ajw91NlsSEYLEd6DU9BSuTjsS7wGqMutFjVWymSA5a5DlAsyTLWrovfH
         YD61KZHHdoUY4q72KDsqa0FfB0Z16yyfy9d3MQKsmSgGZIJinqLhomssc3rQt7Qix9Z5
         yo6wqsePgTAATEwaNh3or6Xu8dFgEHt0ctCGPcv2seV/v1jR6qxORKdyP7bnTLnkgMBF
         OJ7g==
X-Forwarded-Encrypted: i=1; AFNElJ8/P3AAgZUM1j3FL1uDMEzFfc5tuAjwsmCFmgTJFIUSOlUm39Wr+L5DTp/soCXppjAZ9NHQB7T3sr8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyrLSGrbRj7A8ZT14dx71J1ATwrXqXElY4+D8x08iRdOK5c0h8
	vrBlmXK3wO5CCZOxQOQB8EI9dxjCZQZEcAWshvlILO3KRioacbIpV9RGJIoHY72RvV65Opo7xiB
	9mM0IrDRDEQ==
X-Gm-Gg: AeBDieuOBBbY12trdEils60tJFw0bih+JdevUKJ55J9YOmI6nBNvDrkDZigh1l/6YSW
	o2xzpPr0+MBXiuNXyYNAaQHZwRZYOD8FYaHQ0kMm6zGtKrT//GY6zQbr5lldKr6b4nCiKhV13Qe
	151Jszx3VIoC2gQO477dd9oFcDy3LpDTd0eDZMAT/DZXGYVZNdk9pp6bC1gL5JwPnWWFdgMyrLQ
	11i7gKk4af483TjuU+xJd3ef/upV3yj7tOzIvEW9GoEsTFRKcmf4kSRkjCkYDuul4AHKYxTT4+E
	Ij3VzfW9CU0iETCRSwUrAb5J/jczV4tep1iSpRKsX++hPymKeEA8Pe/phs9LGyBj7iEFIP6BagT
	k65YgnPVNKVPzPzuPVE65bgOeZcH9+nufsFDJBZ8rJcWuOgJj0/e5ixIRGL+u0XCKlCAzwC/puO
	zauyl9cOWBaYdrI/3B9fJeUgVelQ5GKqgPWmVJDUgfLB1pSDJL618nxySheRC1VmYUCnH8RHdI4
	vmn8NrkpEc=
X-Received: by 2002:a17:907:3c92:b0:ba8:7b3:176b with SMTP id a640c23a62f3a-bb805301a43mr25463166b.49.1777326367748;
        Mon, 27 Apr 2026 14:46:07 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb808632f35sm10308666b.11.2026.04.27.14.46.07
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:46:07 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bb3c4d8cc29so236887466b.1
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 14:46:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8yDWORvkgb8aHbEr+sefwIA7gYaXYYJ5tR3xbRETkGws11NFpXRTZzbcx5Aq+EGcZ498RwNJzcQO4=@lists.linux.dev
X-Received: by 2002:a05:6402:5216:b0:679:1f4f:9d30 with SMTP id
 4fb4d7f45d1cf-679bb04c1a2mr179970a12.4.1777325976937; Mon, 27 Apr 2026
 14:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
 <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com> <20260427222914.1cb2dd3b@pumpkin>
In-Reply-To: <20260427222914.1cb2dd3b@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:39:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
X-Gm-Features: AVHnY4I-AxqvQRk42MegvhKMp_z4sSEpEzhzpgw2GyV2bV8dezSPoI0JTlwB18Y
Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
To: David Laight <david.laight.linux@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-fsi@lists.ozlabs.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	bpf@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 14:29, David Laight <david.laight.linux@gmail.com> wrote:
>
> I think there is a slight difference in that the normal copy_to_user()
> will determine the exact offset of the error by retrying with byte copies.

I have this dim memory that we decided that you can't reply on byte
exactness anyway, because not all architectures gave that guarantee
for the user copies.

But that thing came up many years ago, I might mis-remember.

            Linus
