Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5CD2032C;
	Thu, 11 Apr 2024 07:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712820237; cv=none; b=dAwqCHb9WFMYWtMNOL6PxkPI/o2zWXdp7wl5Rja3uvkwJsDJZxx6uUnM1wTJwigE6h81fUJP39CuJQkOsZltXuoW4Zw/JyK2aqb99MY5XGN37pCO+vMFVquVBAwpC6xkXz7P9oFV5IN1XATVPVA2HmPY0aUkin9+G9OplrZVV8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712820237; c=relaxed/simple;
	bh=z18IRf5QFUlj4cJLy2CJXHDG2mJhFZLjTe1BxxWEyaw=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=CzsROY7ZhhahIybUNaGCSZDFjaULuxOE5hvt2PKsYvE4v3J37yCEtnSwmO/Bz3MYHwcqjoSSbegBTzd5sHO8tZOOH+5uyIvpqu6sBM+un66cXySnyJI+Jhkyh6+MWUscAQLSyB+zjN1AWOiE/o4WedmxgLNdHuAaPz52MqwVbAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLx29Qqz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLx29Qqz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6FEC433C7;
	Thu, 11 Apr 2024 07:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712820237;
	bh=z18IRf5QFUlj4cJLy2CJXHDG2mJhFZLjTe1BxxWEyaw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=RLx29QqzmKiNKqwNF/s934o/6KIN4QKrYorm720h7i+IPtPVD2Te1Uw6bxplp5wb5
	 q2Z2oqmoenZIr+9MWcwtRswDW1Lz65//BGTbbhyOs9JoWrQhd6eLTWnAELzGa/j9SS
	 lZPWcUr0ioKp2tAD5ZrIecSOxv74Nme2Pj0iYxFBwVleRH8BxEGqEyyLFphOoCa9Vm
	 sSUPWfv4jYC1PUjDZU/4KzQYxkNAKkkfRS4Z1SBGQA2ak7LFcr6B8QeD4vtXalm84F
	 ZzCDYXUkemQtwmUO2ojQBuAGX1J/CA8RGZ+xRAMvq5iBJXeBntaFt9cXQzVYB75Ejk
	 UMPh3Li8Xq+PQ==
Message-ID: <40181e7b29b5418b43d5e05b34b246e9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <76844e0e4dae290425f7c8025f7f36810cb3a3a8.1712731524.git.zhoubinbin@loongson.cn>
References: <cover.1712731524.git.zhoubinbin@loongson.cn> <76844e0e4dae290425f7c8025f7f36810cb3a3a8.1712731524.git.zhoubinbin@loongson.cn>
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: Add Loongson-2K expand clock index
From: Stephen Boyd <sboyd@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, Binbin Zhou <zhoubinbin@loongson.cn>, Conor Dooley <conor.dooley@microchip.com>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>
Date: Thu, 11 Apr 2024 00:23:54 -0700
User-Agent: alot/0.10

Quoting Binbin Zhou (2024-04-10 19:58:06)
> In the new Loongson-2K family of SoCs, more clock indexes are needed,
> such as clock gates.
> The patch adds these clock indexes
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-next
