Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6452F41
	for <loongarch@lists.linux.dev>; Fri, 10 Feb 2023 23:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E64FC433D2;
	Fri, 10 Feb 2023 23:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676072566;
	bh=KuFZz273t8eFdNzJCXor8Ci1dkQEjshWhlEAOiITbYU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LgeXh7/NY4tcx6vNj/e4IkqHfx+EwknUghMOeG30GRk983bAJrBpBD+7EtKw1ST17
	 6t2AcOdXfx3UVB2gINFY8Ufozn2u4s5SUbbTqomZmqhhD3f+Cf3KsXj2ECSAZquV+J
	 afl/igjYUW9sQEV3shDJd3oc4weC4nrQ4RM/knj1Y6KrG/67McFaNCi+IpjaCN68h/
	 f08UWY1tgpyTfmNI0fbIgM1oe2txVDp+eJ6sLiKvvtFYhN6rtcqNuut9nxnGe4WepB
	 uQtvbqJ4NYQxh64RYlCj6+MHSreHi7t6guTAJ0rNghIuwlCtVrz2SBfsOfYo4k7tKR
	 erBpEAT0jMVxA==
Message-ID: <da9c2d34a0dd4209f4c89d0699aa1d0a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221129034157.15036-1-zhuyinbo@loongson.cn>
References: <20221129034157.15036-1-zhuyinbo@loongson.cn>
Subject: Re: [PATCH v10 1/4] dt-bindings: clock: add loongson-2 clock include file
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Huacai Chen <chenhuacai@kernel.org>, Jianmin Lv <lvjianmin@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Yang Li <yang.lee@linux.alibaba.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Date: Fri, 10 Feb 2023 15:42:43 -0800
User-Agent: alot/0.10

Quoting Yinbo Zhu (2022-11-28 19:41:54)
> This file defines all Loongson-2 SoC clock indexes, it should be
> included in the device tree in which there's device using the
> clocks.
>=20
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next
