Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427DB22D4C6
	for <loongarch@lists.linux.dev>; Thu, 15 May 2025 01:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747272215; cv=none; b=HrCCsjDgc3PeK5d5hEwLh6Er9hK8cH+CrlLHFz01HlMqUMCVFMIidC6ozFe8JExHGB6r+u1p9usXhQ3mK7g07+unFSEeNbZeUt10Ueg6/4mL9DCi8JxiKl3rk60fK+a8gb7Qo6o+9OHBGsZG+KYJ/KGwznTphvaHi9EFndg+vxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747272215; c=relaxed/simple;
	bh=bveVUP7APeMyIrUWf8h0xy22367pGHXAPGiY6Jbqon8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qYZUWY7Iar/BIPR5j5/Wpmc9rFOZq2UZc4yTvp7PHqAm50fQG+9tMq02FRrlrcG0DgC5rGII+ZASmeEhWmWuJnKxSwztlbKHhwNskKZf5D0lJfHMHYAPQyT/SnflBQ8fsNr6w0AIiAtWv9kj8lqAMYEyQCrhiGFofOTC1MaJBoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m0FbXIm0; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m0FbXIm0"
Message-ID: <96d9b151-40f9-46e7-b0b4-63569a65371b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747272211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ks83dKmtZt6Dt5qONYWWvSw0O20g9/OKTfH9ULmEY2c=;
	b=m0FbXIm0l9hxfWamPMd92MUU5t2433B1IhWDMxBPVkuK295ArMO0/6+LyCfygTLcHPADv0
	p6bc9QJJh5PBs/VX0kk7PzHIUwyK6NZkHE+suBCCzj86Fm73Ep2ABqDLIXS8cB2d39p1GO
	Xu/uR8MlYrI5xP65vHYwjIoNxVJelKU=
Date: Thu, 15 May 2025 09:23:23 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v1 0/3] LoongArch: dts: Add PWM controller node support
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
 loongarch@lists.linux.dev, devicetree@vger.kernel.org
References: <cover.1746684614.git.zhoubinbin@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <cover.1746684614.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 5/8/25 3:02 PM, Binbin Zhou 写道:
> 
> Binbin Zhou (3):
>    LoongArch: dts: Add PWM support to Loongson-2K0500
>    LoongArch: dts: Add PWM support to Loongson-2K1000
>    LoongArch: dts: Add PWM support to Loongson-2K2000
> 
>   arch/loongarch/boot/dts/loongson-2k0500.dtsi  | 160 ++++++++++++++++++
>   .../boot/dts/loongson-2k1000-ref.dts          |  24 +++
>   arch/loongarch/boot/dts/loongson-2k1000.dtsi  |  42 ++++-
>   arch/loongarch/boot/dts/loongson-2k2000.dtsi  |  60 +++++++
>   4 files changed, 285 insertions(+), 1 deletion(-)

For the patch sets:

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,
Yanteng
> 
> 
> base-commit: b56175973e17e67e3005837346ceb79cc282187a

