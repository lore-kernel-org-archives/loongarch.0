Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAF0186E29;
	Tue, 24 Sep 2024 23:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727220435; cv=none; b=UXz4xfDO1CCLJLV83pJQhwUjGzNre3S7XHdq2znsLLjKt6C+mAgoz4s9i6tmNdRcOo3GbytNyx+54a/WkYiIWLvWb0MQHnTWnbfO2G7KwaNE6OqchSgs2t6mWSpmCFbsJh0dutGtB2wCGEIoUs+VB+7umuxxSTVnYd90GAoBu2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727220435; c=relaxed/simple;
	bh=Dhhs8jZ5GQmUcjStIZQzYTpqOqaYa7kECU18kO07Bmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+6/aRzz8wJ++GxFvk2i2MRyh5hSHC0erJo1on6MHeR8HWRt3jYPX2NpbLBMqLCqmr4PGCMqb/RdSIxLKdTY+D+tCDW0oXpsNSCsGXCkf4CLLCbP5HOorSISXpmV2OIp1qDP4RXjKVVGO6UK+E8yeK6PSGpP2jII8QnitSnEa/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMCa1aF0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMCa1aF0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8535EC4CEC4;
	Tue, 24 Sep 2024 23:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727220434;
	bh=Dhhs8jZ5GQmUcjStIZQzYTpqOqaYa7kECU18kO07Bmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gMCa1aF05en+TtWtuqhDAKo5ET0svPzx1E5zWLlbHlR2CU/Tdt2rf5PeoALIe0ZCT
	 JOZiXyEt8E1xFb8YpGKQX2DmMwWo+rPenELvJoNKoLIKSD/2NGYYjLvMERdqCH6F3f
	 /acLJjQ8+sLW4NZqHobapNa988EVWSFQnT/6edqto4tllGWDMKr5h1wKHg4iSlL+K7
	 bKfzT9Wg1SHcg4Eet8lZ4P6oFCAR6LxtTJAVNnF51dCrUpoPtDskhPE/xljQ7V1Vjg
	 Dy0qR1V1MY0IlRiTzmf6vfd2l+kF0dK+2HlQ9Z/vtkqY1a66dvbCd6YcAgYdlljMDs
	 cVRoqiikMrGvg==
Date: Tue, 24 Sep 2024 18:27:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Herve Codina <herve.codina@bootlin.com>,
	Xuerui Wang <kernel@xen0n.name>, Takashi Iwai <tiwai@suse.com>,
	loongarch@lists.linux.dev, Weidong Wang <wangweidong.a@awinic.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Shuming Fan <shumingf@realtek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 6/9] ASoC: dt-bindings: Add Loongson I2S controller
Message-ID: <172722043321.569300.2338453301730497952.robh@kernel.org>
References: <cover.1727056789.git.zhoubinbin@loongson.cn>
 <4274dc1a3ec8f4a09cc62f55b2ee010cc73f8b4b.1727056789.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4274dc1a3ec8f4a09cc62f55b2ee010cc73f8b4b.1727056789.git.zhoubinbin@loongson.cn>


On Tue, 24 Sep 2024 15:00:47 +0800, Binbin Zhou wrote:
> Add Loongson I2S controller binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../bindings/sound/loongson,ls2k1000-i2s.yaml | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/loongson,ls2k1000-i2s.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

