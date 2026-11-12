Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510502;
	b=H8WZXlnZUf2oFI/0OFcgfKCUY2FZKiewQipQgixCvjt09bKnG4i+fpccZoX2HOcYKw7T
	 lo+mWEzk5Q+Iym5ZMzjYVgaHQAaDy3bbErTUIVP9SCpfeJJbqYRejLUr8vU/Y/9938bMq
	 I/IHQuCVuQafMVyhsWfGeyElJXBuVVliLeAEOWwuDwlDuRR7wbZldVEhSundMy3Q2fgxh
	 XOk1VxY878wq+iQUJdTd5Hvia3D7hoc/FoFzifYtZ+aiBLdoh5YSxCQOchyVap16GmfLu
	 4wR7QTppCtQVSfhF623tTEEqktV6Ka4PRZ54apXyCSgbIArRyDAKOdAlCHpZq98fuQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510502;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=x7avfF8CE7MQkedzx8waSCJsEYoj4qczcsv6b4mLDHA=;
	b=VrykfLlbMnBkHPwMDOeaU8VXvncPnLYVBRfx4UCnUjGvUdMy0l+vkmZTuSljLFYhwaYJ
	 eiw4r7OJ4n4V/VZkOdpuDcTVpahdyJeKpAc5xWwxFZ615NIWrcrx8ftuS5dzdQUDb3xLx
	 AJh3c94eJFPzXja7PQ7SkQ51w+2nfVlU38iG9AyGdzQI+0/ZtdgK57jRH9eHrEYwY+W8b
	 e5ZP/6l7ix2ZHOaIZ72KiyUUzhzcKUBn2WTLy1txwwD19JEar/aOtgm3W/TUeKayLHe5w
	 ZYqY0cP/Ra6nRAJ/xZq5fMnialTiii9P67hOOw434dBM85JCgFvpKDuXNPEABHjfJaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C13606A881
	for <loongarch@lists.linux.dev>; Thu, 12 Nov 2026 19:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7C13606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so173596e0c.3
        for <loongarch@lists.linux.dev>; Thu, 12 Nov 2026 11:08:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510502; x=1795115302;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x7avfF8CE7MQkedzx8waSCJsEYoj4qczcsv6b4mLDHA=;
        b=oIlaQV/1YJ6C3DxqB9scX9mmXRPc04zDicjVOVVLNlgy8A2nTEZ4A2uGPlAEuDUKGV
         dJ2/OG9vn4gAYDk9lW0LsHJk5S56WFxmun2fwzfgDtQKKxzTu0WK+FbCtBhMD4edxVIZ
         9jZmD2Xxs9CX3HsJ+Kq6/LLsr8LWTDuNKVI0FqsaWym6cIEk8SikFeAbsiH4sk3TrXYD
         Xk2hXvx6Qg7u/dHzKgY9HKkFI0GeKFS73hlrWCYwUHioEBNJey8nsOX/idS4J7hqBOcl
         ry9V6C7OxLiP9JfX+CWzswcusBUo5AZSjFeLD8oPyix2M/VYIss/hgddlHTWTR9lxEcJ
         JFwg==
X-Forwarded-Encrypted: i=1; AL+hErG118nvBrsHqq/IN8fR8X2mA0Zget32wu7UqFz9CBEPaPOwH+U0WFxqm4If5Tiwru3Rdo7aYRGiMk4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/NUpH+DmybsMn89xjM57WD0yv0zyQ6yoI1tr999D7zKj8YWoiW
	nVN07up6SIq8zKan+u6Wocr6N7JdP2+lJ3HHjwX4CbBZsiCRqzAEX6tRQ07Ur/D4rGE=
X-Gm-Gg: AYBFou3P9tgawf4yyIAKzYMk0LCTQZNYlgZQNyJ1rKOAH+L7dWtAVYMJxCKBVkizw8X
	zXEuSx5ActaDFKjOSBFdh+wY1H95GmxHT8o7Rp31SH9RLX035vOO26VoHbqopric+H4GYbmZ4Dh
	9QBTpYzzqceljKopqe89keDmmLR7aU91xUMEU0eMZzxaNUJLnUnvhSmxsdIV9/XxC7KJcOI1Trh
	gPx3frg7B9xQSfVm9nmDMSosJCDIKkDPgMBQRlhdjj1QCRzN9JKjhhKLd2H8DVU9bH3ISMdIG4n
	VJtzkZy29duXGweXLjelti2vW+5edVGAoWaxZZjMm/NUmmybuMUMYA/ZK7EYd0BNj2ZTsklDJSK
	XXE8bwZPSA4j65qwFbqveE+MOssWE7xDzJwQL2taLxrN2930QKENxrDX3aymiD+iFF8QcTdjGxl
	95FG0IjzcfCqChXLzm9eXSwv3uY60tZ4ULZUkLXSXc7k//SKJY+bpvk34i/QT9fJk/fY6QlDujJ
	WtsYg9u6HMBPtELby1Yd+OZDduDfdZCbwz2vQHo9obJ/3YEdbhMoiwFYgngE7jq3I2JVzOum5jY
	auHwfYsiz4xYXKRMxeiVvAYBDQeWnkKc8leeMsCDjRT2cV03zwPCttSpUfT6gZGOa2w=
X-Received: by 2002:a05:6122:54c:b0:5ea:a1ad:6376 with SMTP id 71dfb90a1353d-5ee346785f0mr53777e0c.1.1794510501629;
        Thu, 12 Nov 2026 11:08:21 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3420b5b3sm82538e0c.11.2026.11.12.11.08.02
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:08:10 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7d2d18f1bf5so62700137.0
        for <loongarch@lists.linux.dev>; Thu, 12 Nov 2026 11:08:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErECQsX9EMGlnmY5Fe2SaI+P//E+egxmXf97sBU2GNT3iTMkkea22cChllGwQvm/fecdeN2D/rar0nI=@lists.linux.dev
X-Received: by 2002:a05:6102:c15:b0:7d2:8dd0:2eb with SMTP id
 ada2fe7eead31-7d64d6ed886mr73919137.8.1794510481935; Thu, 12 Nov 2026
 11:08:01 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org> <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
In-Reply-To: <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 20:07:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgOGjwOUMxSabUgtaVeKZW1wx78XOJL8joGKkZEj7RZw@mail.gmail.com>
X-Gm-Features: AclHuK8l5OcVstuPYNpoHJ657hIuMQK5i9ySH9sE9lHb16H-lVuh0fnzCqi0JCs
Message-ID: <CAMuHMdUgOGjwOUMxSabUgtaVeKZW1wx78XOJL8joGKkZEj7RZw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/4] sh/crash_dump: check ioremap() in copy_oldmem_page()
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao <leitao@debian.org>, 
	Chris Mason <mason@kernel.org>, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org, 
	kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, stable@vger.kernel.org, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 17:43, Christian Brauner <brauner@kernel.org> wrote:
> copy_oldmem_page() maps a page of the old kernel with ioremap() and
> copies from it without checking whether the mapping worked. If it
> didn't, the copy reads from an offset into the NULL page.
>
> Return -ENOMEM like the other architectures do. read_from_oldmem() turns
> that into -EFAULT like any other short copy.
>
> Fixes: 4d5ade5b29c6 ("sh: kdump support.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
