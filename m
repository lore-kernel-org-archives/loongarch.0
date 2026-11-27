Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795755461;
	b=mf78aHqjWvVOVqu1kWk7SM41HQp6YvXUVl3zbFJuaXeL9sgryG0tIlzTnrGhfcBGOHN/
	 qgl5cJI3Rh+ngm84nKEcBnJ+nxjtYRpH4tQD9b/CUyvre8nDoQa17TFzhzdamr24g5mta
	 jR2VvTa2gYGuXkLDTj9bB2+Lu5K2sTkaQ2QGrkZmyuV1VbQy3g1jU1jWJh6KGoAi3Wkbu
	 oWXfTkEDbbqjqNAkHXahqayQDXCQoC8bcePHLMHxWPjheUubTH5kqwcS6b21CwQoCiz/e
	 R8EXKKpm6z2yH17LlSPIFAphzWUGvniVGmpnBGRP5OV+usy4W2THhCv3+mA2mJvBYKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795755461;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LReKIMGpQMdEwegfAECoPI7D7CsPYco/Xy1/ZIW35fo=;
	b=a3dPUjZ9jXCW3Yh3oGm7VkjPKs6itkoS4gdzxrj5wVPPXqo/SEBa2TgttDPcydeznuqa
	 YT/J3XWzltaHxgY4c4+6Jr1I40nqsD+LkeygsnqFjajl64bN2W6gVCdroE1TrH2qo6HJF
	 2ytI080nwiVQSjUbxiGSE5GJS7Sz58V+1a1s2iWC0HcpaYD2Yiqa44TJkBwHspXWqy7/j
	 FEfw3ORelSBpVG7g/SWn2kolD2ex7AxEuncL954N0TmbMNYQewYz3U5ywN1Lr4Bb7U5ZD
	 /j1QzgsQOsLtvYWUHgmfuN0AYVpwCyU5ezIM5PVNvae4jOdw2QM1PJ+qCfa4T8uCR5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P+YRs8DM;
	arc=none smtp.remote-ip=95.215.58.111
Received: from mta1.migadu.com (out-111.mta1.migadu.com [95.215.58.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8CA606A31C
	for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 04:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C8CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P+YRs8DM
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=LReKIMGpQMdEwegfAECoPI7D7CsPYco/Xy1/ZIW35fo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795755458; v=1; x=1796360258;
 b=P+YRs8DMwW7OPNyk99iCa5kgli7doqwgnXXqDhTriUxK8YkhcPrmtJzvKmGf5KF9D6/eQSXL
 BxTsTG8K5t9ChvPVLFDPkPAh4e9zQPkQXdK4zzbtM8ngBTAH7UzTd97kEuQYTURH4BOKhlQLqRI
 GQZ2O5ymoPX1jyp0pRh4aeGQ=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 09a14d0bad91cff5;
	Fri, 27 Nov 2026 04:57:38 +0000
X-Mizu-Trace-ID: 09a14d0bad91cff5
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	yangtiezhu@loongson.cn,
	hengqi.chen@gmail.com,
	chenhuacai@loongson.cn
Subject: Re: Teaching LoongArch BPF to Fail Any Kernel Function
Date: Fri, 27 Nov 2026 13:57:33 +0900
Message-ID: <20261127045734.4276-1-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <c5f9ff8-ecec-e033-a1d8-4fb53392c41f@gmail.com>
References: <c5f9ff8-ecec-e033-a1d8-4fb53392c41f@gmail.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Vincent,

On 2026/11/27 10:25, Vincent Li wrote:
> FYI, this feature seems cool to have for loongarch.
> https://lore.kernel.org/bpf/20261114051805.683966-1-alexei.starovoitov@gmail.com/

Thanks for sharing. This looks interesting. I'd like to look into the
series and see what it would take to support it on LoongArch.

Thanks,
George
