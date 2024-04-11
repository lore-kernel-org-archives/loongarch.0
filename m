Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEFE13DDD0;
	Thu, 11 Apr 2024 07:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712820585; cv=none; b=HKA84PZMDmyCk0L/hspkK6rti8reVDOX6yYGicQbOBvBKDYgpiHaJtC15WaH1gH1vd03ZJdts1l1ip5VC6Mg4GXd8N/516t47ucgVj4AWF0bTMGmT/vkn04Iz5TBU3jeFKXv9WHyuBOhkh0wKH4WdqwabmDVAXxGlgt0+YqN45Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712820585; c=relaxed/simple;
	bh=4LIaNVYq7oO0MplxENihXTe7qdCL5IID+a7VeY2Oa+I=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=NWd6CnF6vhOA1zXXG2pyue/nbETfE/f64ArliSLE3V2IKQhMD3h7IDnjuVDxDfQY3+xnyt3aoFhbZ8hFNIv326yabwzf85CHP4hYWvF9nOfJU9Z9+cYheObfv7DHadttMsiT4o412cYgXRfW6gu3lc2nn3PfQ4jY6PTRUiOEFmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtnviCed; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtnviCed"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE67C433F1;
	Thu, 11 Apr 2024 07:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712820585;
	bh=4LIaNVYq7oO0MplxENihXTe7qdCL5IID+a7VeY2Oa+I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BtnviCedQTWejhQZ6KDYB1Hous8qbnXDNJAOcn1x32pD40rIsh4PMvCao62Bbh5fg
	 zk2hMe+/gb6uam4hTOE4mtMCzUqJM/Eu5f00j3l7SQFYPllU1dNXezNqehleH33j77
	 wxF0vbLick0Xo7eakOW7MdjtFEW1tBr4QLx54uYq5qftxF1tcWVS050zjWFj+mwWZq
	 wbV1DtWE7Ii/QYqR7Og9e+XHsOp29J2YmFsHNHxtRWwWBG7pNJpUp94lRzN3NjbGra
	 J07rHAdPW0hCSYbPZO2gb9AX6s3aF7r6N2hBsMCq0uLXbL8O2NGndVBYcGtrZP44RS
	 zvFj2rRPS8ifQ==
Message-ID: <6eed33cb6a875bc05aec38bbe5f55998.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8b0b5851783acf8ebe13b50391d15b58cc181613.1712731524.git.zhoubinbin@loongson.cn>
References: <cover.1712731524.git.zhoubinbin@loongson.cn> <8b0b5851783acf8ebe13b50391d15b58cc181613.1712731524.git.zhoubinbin@loongson.cn>
Subject: Re: [PATCH v3 6/6] clk: clk-loongson2: Add Loongson-2K2000 clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>
Date: Thu, 11 Apr 2024 00:29:42 -0700
User-Agent: alot/0.10

Quoting Binbin Zhou (2024-04-10 19:58:33)
> The Loongson-2K2000 and Loongson-2K1000 clock is similar, we add its
> support by different configurations.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---

Applied to clk-next
