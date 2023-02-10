Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0C82F41
	for <loongarch@lists.linux.dev>; Fri, 10 Feb 2023 23:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0382DC4339B;
	Fri, 10 Feb 2023 23:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676072613;
	bh=nBuvPyelXr4iBjwuXRn1yKj6xtX4mp9S6G9RcdQLJV8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=i+neAW10lz+HGlhMeTk98I6o8W96sVJp7ubINnbgPdG4wG6EPfItAz4rtCFUAo+UH
	 HwqPTt0MgEsky6Nn27fyaqJe7M5c2kO1Y5nwh2z8GFCKHicTG7nkRK3T5tJQfGGHKQ
	 WYsuO59VQYpxE3kmJNN8QaXOe3hM+V0wkt6LqrLm7gvzzURn+vh96dk1JAWM3DHW6X
	 RUpbgdfHXR1HK/AytQpyO4WKwNtoZ9FUGhynGUf0iPYM4rawvL8xmw3Ctbg2UnHLOw
	 SINv87FnD8HyF9bZFE2olRYXp/bd2sb5kck53ropb2nZnw+dos2QIyV9JlBp3rkx4S
	 VsxQyyvPjcyEw==
Message-ID: <deffd7b0d7f832b682dd6bde113b60ac.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221129034157.15036-4-zhuyinbo@loongson.cn>
References: <20221129034157.15036-1-zhuyinbo@loongson.cn> <20221129034157.15036-4-zhuyinbo@loongson.cn>
Subject: Re: [PATCH v10 4/4] dt-bindings: clock: add loongson-2 clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Huacai Chen <chenhuacai@kernel.org>, Jianmin Lv <lvjianmin@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Yang Li <yang.lee@linux.alibaba.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Date: Fri, 10 Feb 2023 15:43:30 -0800
User-Agent: alot/0.10

Quoting Yinbo Zhu (2022-11-28 19:41:57)
> Add the Loongson-2 clock binding with DT schema format using
> json-schema.
>=20
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next
