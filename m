Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3351C20011E
	for <loongarch@lists.linux.dev>; Wed, 12 Feb 2025 20:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739393406; cv=none; b=m3nyN4vt4osAVFboDCe0Sox19j1o5DPOpk1KI7BNqXLuG0WEPSbjyedBZUaeTcXDASpo9fA4fji2IJzfiRLsU1VXL/sJneIApHPxKiIZAkN9etD+73K3esiGqkiMvUr++Oa+XL1D2KOd8BfhjWJe/8S9u1ErUJLnfXNEmqfvoMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739393406; c=relaxed/simple;
	bh=7QUo8lq0zOXvMRM2Kkw4Zo86apOpRGfWnw798xZKkyE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gWhRO8An0V3Sv/dnizrDbPuwGW6kA2awQt6RiPujan/I4d7tpcvD23m5EeZ+e+hZGrPioHI6GwjYvp0Cqto4ILKIsJ7Pe49OZ3XPoKAWZ8/8kB6LTTyRqeJNWf8xFfZ2XAmaEflvTOJd4/TtCMe15qYGKmulHxgOFuI1XHCwdlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t3vrPcga; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t3vrPcga"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4395e234c02so195935e9.3
        for <loongarch@lists.linux.dev>; Wed, 12 Feb 2025 12:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739393402; x=1739998202; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05bFiLRqtjieBdQP28ZStS6jjJuxslhK7B+dgz1ufHY=;
        b=t3vrPcga7Hq6M+Kd9RZXa+nh6naakLMlZeVP/lnNbuIanVzYAk1rquTf2s8NYO0NH9
         1x7S7ROLqGefx9UqvTYs5NSt42Ndt3bgVn4KVEkYT8MLM/Vn+9A6iFkklyK0EJrRG7QW
         q93L+NN7iLj1LjyidiQRLwl47T5tCoNAAols8+mSSjwi/zIAhOjb+RfhjzkwX98unJl5
         /FQiaNhisckVZ1NAfVxyfa790infNX1ZSFrdR7u/uzIqia3ogUMVSGni0WarPK+XBPEp
         5iYIhZPak3UQHLvZFNYsA9IgTLN0l2Vqry/NdPGdx7xpXS4D6VlIFH5gNlklFwiw6MkB
         8ulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739393402; x=1739998202;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05bFiLRqtjieBdQP28ZStS6jjJuxslhK7B+dgz1ufHY=;
        b=SWQPA0IU2I/0KSomV1WACnUUJRQmnpkeO3hcD2n3XnDd82o3/jzloYH5zB6g5HCGIh
         zXwbx4UcpagMc9OU6D+Or0wsZBql35MYfGoAARpl2u+tR/jGnl+m76HkpZ97kzbM58uf
         byjbUgTlWI8O26XT6WOOfVtReuSJaZUAIjwIlbBeMCRJf6iHao2n97X5QeHSeTZ2E2Xq
         UtHj62Gsy5aNE/oqP12SvJ0h4F56N264k8KAla0QGhfMXe4WkKpiZcZRRdpSN2c/MQfr
         nt31WLm2tFwVchGjwYJE26trPsdz7dxkY7L7X29Uh3cCly+9hGRICml/ZppSUbDo7s9h
         q76A==
X-Forwarded-Encrypted: i=1; AJvYcCWu0j3MjHqvsECA4az3kQ1HTfZRsToAg+diDT4GOR3hwJ97ixbpabbOxZyOMPAkeWAYFQ0ACd6xMq4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuxAVhA64GhL5sxmnB80pmdbwnYSkFHWHLjKd0Xd1813O+C8fR
	7Ggb4ZvKCN5c3t8SaKZKMV9KLUbYAJqFewCmldCFbbxPbGROlKB5ZggyXcUpaKM=
X-Gm-Gg: ASbGncvliaC8J8WndDtHy5anpNAaZTV8UMzPMqkbj1MemkfnOCorqfPWuu5eFMIHKBT
	0PBoxaOyeSmAjVdavoenuHGS7xOvMOIupTeyIUaBd3+B0VmKvn7dsY6w0uOksbSKNndToV7WNNt
	iN7acPZYbvW74zbCMabYmTjsP5JMcRZNoWR42cUVbxnR3j+YVp+eFPsX9wgvv74qc4ZCe6A0lfv
	HV1UC6YHkTmRR9G71uA3HcIWRNPdCirlpFL7VgZ3it/uOQWod0mEEJqFK3w4YMuN56fFMCRm+qy
	y57IhY0uEFVVJDfw1kC9Up4rrf/unKk=
X-Google-Smtp-Source: AGHT+IEBtbJJPvZYtnqI1EcUYSzvnE3bHzpiZAK+Kj6ubquz7Vmwq6Ph8AWnkEWgLrniziBTqXUdZw==
X-Received: by 2002:a05:600c:5103:b0:439:560f:e7cc with SMTP id 5b1f17b1804b1-439581bfdd8mr18910825e9.6.1739393402471;
        Wed, 12 Feb 2025 12:50:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a056151sm30461495e9.16.2025.02.12.12.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 12:50:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 imx@lists.linux.dev, loongarch@lists.linux.dev
In-Reply-To: <20240717-anvil-ashy-544e80a1317c@spud>
References: <20240717-anvil-ashy-544e80a1317c@spud>
Subject: Re: (subset) [PATCH v1 0/4] Removal of non-existent DAC nodes
Message-Id: <173939339997.59416.11108011581545463665.b4-ty@linaro.org>
Date: Wed, 12 Feb 2025 21:49:59 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 17 Jul 2024 10:37:52 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Recently I've been getting triggered by abuse of the Rohm dh2228fv
> compatible to get the spidev driver probing in Linux on development
> kits by employees of various silicon vendors (like NXP or my own
> employer). I had a look around the kernel and all users other than the
> original Clearfontz board added by Maxime appear to be similar abuse.
> Drop the non-existent nodes from all of these devices :)
> 
> [...]

Applied, thanks!

[3/4] loongarch: dts: remove non-existent DAC from 2k1000-ref
      https://git.kernel.org/krzk/linux-dt/c/854a080f0b73ff966a813ec2dc53891831daa28d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

