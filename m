Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE31B37FF69
	for <loongarch@lists.linux.dev>; Sun, 22 Mar 2026 12:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182962; cv=pass; b=MzWGLA0lGxiCscwDG3N9F3zyPjkqxmQ7VYPz9TuokFjswtgEz6iwMX5Dt/98ttWN9tsAi4h1daMGjmfhJSRvoELnOCAblEA7QskvFl/zbfeLa1NaBzydxnS9qIaFcm+uYjRqzd9IbeUVRZrz4wYQ42TTHD7KnkE2AvhiVgOOD2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182962; c=relaxed/simple;
	bh=/G4wv1AYpuDDOThiFlf7yd2BqIrHdxg81+ps1exdPJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3k86OpFauB7kE14pY3Yjnii+D0g8M352gG1071xkNT06vPggLaaHsSkRbNMr6qSALUkF917wpqR/eUtkab+0bJiz/n2OlCw4MU6F6tby1JjDgl4Qmh6fo5IhSm357vo/byCkMYjwiuakKRYTfKvEQZvy4oOvjQmZux7Zjrg7LM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=RYV0qZt5; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="RYV0qZt5"
ARC-Seal: i=1; a=rsa-sha256; t=1774182953; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Yv2PS3JweAqdYSO4TICBc119goOC/fCtLF9QKC3iCR+PGPRTBw4nwiCN365ptTrGyebRGt1uJNzQdKPy1Dy86Cw8150+dnNxnpzbaAidZ37JpCmUYI4X2ocBxUUZZK8LZ8PGP3a6RtodsQo9z7VfyVMBKFXQ3Y+FCRSrdBBf3vI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774182953; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sCP65OrZkkXH1dJ+E9hSjkpXLr7tFsgk9B2weoSwSqM=; 
	b=hVGtfrbdcDHnjcembCfhcaKMPt8JEOCeDGgCXXZA1wsqvVTlxbXqy8xVL2ScE9iOLnA302qeIXet5bgZfp58GA3ZJaF49X6eDdtfk+EyRHtKeE0Brk97KxNnKPZOtxXYOEopaB87kL22r14q090c5f0M7Uzg7W6NcWQNwp+e8VU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774182953;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=sCP65OrZkkXH1dJ+E9hSjkpXLr7tFsgk9B2weoSwSqM=;
	b=RYV0qZt5fR4nz0i6P6OpKLV/zj8owzRSmDxlUcWD1AdDU8Yw2GHi+laeFVYo3gkn
	BpnFJLXw1gpqA56bZcxINvOte3lEKrb42xgvCZXHZ2H+zcxWXXhs437nG+4ZAhqO55C
	6CTqlsyw1jJ8d1Q7sUhoygpNSqFZvfv/dTiae2YI=
Received: by mx.zohomail.com with SMTPS id 1774182950939448.0578904738061;
	Sun, 22 Mar 2026 05:35:50 -0700 (PDT)
Date: Sun, 22 Mar 2026 12:35:35 +0000
From: Yao Zi <me@ziyao.cc>
To: wjjsn <wjjsn@qq.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, chenhuacai@kernel.org
Cc: kernel@xen0n.name, devicetree@vger.kernel.org,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	wjjsn <2858482031@qq.com>
Subject: Re: [PATCH v5 0/2] Add Loongson-2K0300 processor support
Message-ID: <ab_iF2hjZRfp16HP@pie>
References: <tencent_325FB1D2C600CD55E367332EC453E5A64B09@qq.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_325FB1D2C600CD55E367332EC453E5A64B09@qq.com>
X-ZohoMailClient: External

On Sun, Mar 22, 2026 at 03:13:14PM +0800, wjjsn wrote:
> From: wjjsn <2858482031@qq.com>
> 
> The first patch adds the necessary DT binding documentation,
> and the second patch adds the DTS and DTSI files for the SoC
> and the board.

Please note I'm working on basic drivers/devicetree for 2K0300
platform[1][2][3], though the series haven't been updated for some
time... I've re-written the pinctrl part, and will try to re-spin all of
them next weekend.

Also, previously Huacai expressed preference on delaying devicetree
changes until basic drivers are ready[4], so anyway we should probably
get driver patches merged first.

Regards,
Yao Zi

[1]: https://lore.kernel.org/all/20250523095408.25919-4-ziyao@disroot.org/
[2]: https://lore.kernel.org/all/20250811163749.47028-2-ziyao@disroot.org/
[3]: https://lore.kernel.org/all/20250816033327.11359-2-ziyao@disroot.org/
[4]: https://lore.kernel.org/all/CAAhV-H6EDEf3U6w5KY3R3HCAdAbqDefqpE3ktCQeQtFbDK2Ypg@mail.gmail.com/
