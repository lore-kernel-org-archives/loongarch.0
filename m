Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1483C2EAE5;
	Thu, 11 Apr 2024 07:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712820567; cv=none; b=Xh1Fn4aBIbb9iyXpy3JPR+XYy5vy0Jlu8YoI86Aais0WkuL9naXprDKcIcuUZAwfoALt8/0oZwB0wgEFceRZFGjxQLVy23f8yIP2zwcQgeRxUesSc6Vjso7Z1EDYAjrMArIRS6VFUmJp2XTVLRNC3rqC5AfV7iWEHvkuAiNvKiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712820567; c=relaxed/simple;
	bh=iYh5DTn4IV3LuNeSt+T1SDpAtg1qBIn6ke8pOu2PueA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=DOLYHMipK48CGmawg6P0WTdXeZV3vG8nx/G87fRBEob0N+aXBPH4eEFkXkETezQ45diCchG1CqpmRzf1pjIN9jhOVCQuWBhes9kxYNFkAPfcWqiiMeJSi0ZUQ/yPn4nRJU8Z8BVQ6azXYpRmnjyC4l1FQzen631daQHh0CyNWHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a8cqi/Gm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a8cqi/Gm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6EFC433F1;
	Thu, 11 Apr 2024 07:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712820566;
	bh=iYh5DTn4IV3LuNeSt+T1SDpAtg1qBIn6ke8pOu2PueA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=a8cqi/GmJzC7JWeXbuRbP7zn55vUl4xWG5+7g9+jV0kxLBCLJxy4uAayfFsWFAjpN
	 pZj/zdSX9D9UGXp2sz/JUbBABhmDQg6iSnZ0qsEbwSIDw8dDbcTv2J2d4WBu1xz/P7
	 LAOr4yFAFsHtmfzFoNqb3+kVDIK2q5M1zxd972siiqRpezpe4CGHvzoNOYkkQp9V/w
	 IS4uFdGZ/yzkUi5ksKeCzNRDCBV/OsN1YFsV4ZjggfRh/amVOuQ7R8x8Vjw/v+Lilp
	 viJj83isbgMZovQS8Fc9mrmGtLijyPel4AcmCyTsfXoBlOk1YI1Dua4JGSjMJ1YXDo
	 IaK0+RxfrGGRQ==
Message-ID: <626d88e0dbeb10e3c923e4691257e417.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f767a1783dc590fcd31ff7d4459df2cf80196de1.1712731524.git.zhoubinbin@loongson.cn>
References: <cover.1712731524.git.zhoubinbin@loongson.cn> <f767a1783dc590fcd31ff7d4459df2cf80196de1.1712731524.git.zhoubinbin@loongson.cn>
Subject: Re: [PATCH v3 4/6] clk: clk-loongson2: Add Loongson-2K0500 clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>
Date: Thu, 11 Apr 2024 00:29:24 -0700
User-Agent: alot/0.10

Quoting Binbin Zhou (2024-04-10 19:58:31)
> The Loongson-2K0500 and Loongson-2K1000 clock is similar, we add its
> support by different configurations.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---

Applied to clk-next
