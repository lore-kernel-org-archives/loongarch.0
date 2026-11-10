Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310060;
	b=fb9Xn6xk2j18exVJdU9YQ0PNzsWQfDi0V5T8Ex/ElsvEvpHuceY7igRCMZBQq+wNHWYs
	 UmxBJNGZI4jygISTWugUzGUT90frOpdldc51gMQz9kjS2eSKlE+xusbI/HZFdX8YhUF7Z
	 xIZmh1kt0/Tx8UyQlR8ZzKj1qaznQsdpdeuuANZyPETAAXaMxKICWPjWfkIp+MZ7+8l9U
	 0qL1Raq2cy+QUC+6Rrma2W31ZYRcHAy5JCmWGkVTOyQxm8gnDFILeHjLWwCBVLjM8ZsO/
	 5ik2Je3Nf7B2eaqawaNvNXKHJeWT2jYEeVDHPVPXnfK2yolSZiBLzZeZZgCyyUJFwbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310060;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=9HIzVh31hyf55nxZGnhbK7DgBdHZtDQ985jcK15h/6Q=;
	b=xPd519YVPpljWZsulFmcLyid6M+N9jTe+OV5PNQgw/NiQiJn64S4aB/r6C2n8nvYQjJy
	 oUQ8PB9WETfiyPkysqH1FZMOeqYQyFK0yQFUi7lyTcAf439icfNStuKFYH5bSkJ0f5XCm
	 JbZvXEAKhyHlPFPwKPLS3lahEvVF7NSFoErjaSiutwzweshsV/WDOtTHic2MiYizMqoem
	 w0gbgk54CE04S8OVpRDgnIeGZ5YGigJU3vwhyeFPmP+cAL2hPDIdq9RIF0zInfyBJdAqh
	 gS2uEs2FXhacCYVklfSo9eruxTHn43bk1fV+QYLOfJ5SlgCQzssgtYElhtHBdhUljpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=O9Oy9UBV;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D59160A2604
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 11:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D59160A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=O9Oy9UBV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=9HIz
	Vh31hyf55nxZGnhbK7DgBdHZtDQ985jcK15h/6Q=; b=O9Oy9UBVAzW6BoI3x1aK
	wMI2MrrOyTXtIjK7MgYSni5W9nt4sN9PqoBfqcJTaDfaKkeZC7DTM8u0tBHa6BIy
	iNPGIAB5ygVVIaCro1CVoMXswbLl2ePSSG49Xc2jUL7F0plJ7zYHzbOuMYMMFqKk
	TnZELgPF81ZUil35Oj8PliGWi5lfQH0Iyd1y8aR/61umBDy94j9VolOKB8RW9nEv
	mwopaoy6790Gido5nzO6s4AI8QRLvFUnYJyUivnelK+nZ2626bMGgNthO2NJsdDe
	J1DMyDpsy1QZR1/T8uKOsEebPk6jZenBFPPOwwmW8NCwjXDMAAuIjSKzU4QaEe6c
	Gg==
Received: (qmail 210884 invoked from network); 10 Nov 2026 12:27:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 12:27:36 +0100
X-UD-Smtp-Session: l3s3148p1@6JqJXepfqrEujnsO
Date: Tue, 10 Nov 2026 12:27:36 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hongliang Wang <wanghongliang@loongson.cn>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, loongarch@lists.linux.dev,
	Xi Ruoyao <xry111@xry111.site>,
	Huacai Chen <chenhuacai@loongson.cn>, stable@vger.kernel.org
Subject: Re: [PATCH v11 2/2] i2c: ls2x: Add clocks property parsing and
 adjust bus speed
Message-ID: <avL_qCs9EFquoZ7_@shikoro>
References: <20261106030203.15709-1-wanghongliang@loongson.cn>
 <20261106030203.15709-3-wanghongliang@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106030203.15709-3-wanghongliang@loongson.cn>

On Fri, Nov 06, 2026 at 11:02:03AM +0800, Hongliang Wang wrote:
> The original driver uses a fixed PCLK frequency(LS2X_I2C_PCLK_FREQ) and
> fixed div(5) for I2C bus speed calculation. As PCLK frequency and div
> vary on different SoCs and ACPI platforms, this leads to inaccurate I2C
> bus speed calculation and poor adaptability across platforms.
> 
> Improve the accuracy of I2C bus speed calculation across different
> platforms by parsing the real I2C bus reference clock (PCLK) and div.
> Support both DTS and ACPI.
> 
> For DTS:
> - Retrieve I2C bus reference clock via the common clock framework
> - Fetch div from match data for LS2K/LS7A series
> - Fallback to default values if clock lookup fails or the obtained
>   pclk or div is zero
> 
> For ACPI:
> - Parse "clocks" property to get I2C bus reference clock
> - Parse "clock-div" property to get div
> - Fallback to the default values if property parsing fails or the
>   obtained pclk or div is zero
> 
> Calculate the I2C clock prescaler based on reference clock, div and
> target bus frequency with the formula:
> 
> prescale = (pclk * 10) / (div * bus_freq_hz) - 1
> 
> Dynamically acquiring PCLK and div per platform ensures accurate I2C bus
> speed calculation and reliable operation across different platforms.
> 
> Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Tested-by: Xi Ruoyao <xry111@xry111.site>
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>

Applied to my for-andi branch, thanks!

