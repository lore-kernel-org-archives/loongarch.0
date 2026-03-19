Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD5B3C6615;
	Thu, 19 Mar 2026 11:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918813; cv=none; b=EQHs8vg4EENw2i7QrYp3QKM9ZsqIwg53XZPyQdP8JDIuSfbFvFh8u4nh1jsKXxqV1WZW8aXIoNNrOLtsoUogRA6rWguXEUWDpU5UkqqMO64eG2ZBaf08LdrPvYwduaP7APaMGL2VrkvDnTkV4ROhD/Av7KDn52ivBAwgiRL97gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918813; c=relaxed/simple;
	bh=zYf03P8u45Fv4dMDysWd8u0Mx0wOVq5nKovrFEBNLWM=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=YaX3wRaVteUnJz5O5EmVRmKZFdcG1Lszi0H4DjHsGu9NQJCYh6zcfYwF73XMY8jk7p+7A6SglO6kT6LqeqrQSmH7C4yw5iPL7uQuNzTemaXpYrUAVCqLdQf0xt2DMozQ2Qa5qJyZuw3B3RRCcTf2QDbbP3VZ14nICcOb2sDHX9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1c3V7zNl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1c3V7zNl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E6DC2BC87;
	Thu, 19 Mar 2026 11:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773918812;
	bh=zYf03P8u45Fv4dMDysWd8u0Mx0wOVq5nKovrFEBNLWM=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=1c3V7zNl/gEnylOFh7L4nsWrf2e8iqSr8vz82ckJGieZXUlhbumSz5FCbqOT60Gdh
	 pbDeJeB7S+/FiGQLTmyn48lTLmxGTKBP35xciIJxCljcUZv67/asVwzvhdtoozrVw7
	 dtECoHH+dOi5u9zfBACVG/ZzgYJCzOQjknKZhBa8=
Subject: Patch "net: stmmac: dwmac-loongson: Set clk_csr_i to 100-150MHz" has been added to the 6.6-stable tree
To: andrew+netdev@lunn.ch,chenhuacai@kernel.org,chenhuacai@loongson.cn,davem@davemloft.net,edumazet@google.com,gregkh@linuxfoundation.org,kernel@xen0n.name,kuba@kernel.org,loongarch@lists.linux.dev,pabeni@redhat.com,sashal@kernel.org,si.yanteng@linux.dev,wanghongliang@loongson.cn
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 19 Mar 2026 12:12:52 +0100
In-Reply-To: <20260218121242.2545128-1-chenhuacai@loongson.cn>
Message-ID: <2026031952-uncrown-gondola-399d@gregkh>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    net: stmmac: dwmac-loongson: Set clk_csr_i to 100-150MHz

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     net-stmmac-dwmac-loongson-set-clk_csr_i-to-100-150mhz.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-217275-greg=kroah.com@vger.kernel.org Wed Feb 18 13:13:16 2026
From: Huacai Chen <chenhuacai@loongson.cn>
Date: Wed, 18 Feb 2026 20:12:42 +0800
Subject: net: stmmac: dwmac-loongson: Set clk_csr_i to 100-150MHz
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Yanteng Si <si.yanteng@linux.dev>, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, netdev@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>, Hongliang Wang <wanghongliang@loongson.cn>
Message-ID: <20260218121242.2545128-1-chenhuacai@loongson.cn>

From: Huacai Chen <chenhuacai@loongson.cn>

commit e1aa5ef892fb4fa9014a25e87b64b97347919d37 upstream.

Current clk_csr_i setting of Loongson STMMAC (including LS7A1000/2000
and LS2K1000/2000/3000) are copy & paste from other drivers. In fact,
Loongson STMMAC use 125MHz clocks and need 62 freq division to within
2.5MHz, meeting most PHY MDC requirement. So fix by setting clk_csr_i
to 100-150MHz, otherwise some PHYs may link fail.

Cc: stable@vger.kernel.org
Fixes: 30bba69d7db40e7 ("stmmac: pci: Add dwmac support for Loongson")
Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -14,7 +14,7 @@
 static int loongson_default_data(struct plat_stmmacenet_data *plat)
 
 {
-	plat->clk_csr = 2;	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
+	plat->clk_csr = 1;	/* clk_csr_i = 100-150MHz & MDC = clk_csr_i/62 */
 	plat->has_gmac = 1;
 	plat->force_sf_dma_mode = 1;
 


Patches currently in stable-queue which might be from chenhuacai@loongson.cn are

queue-6.6/net-stmmac-dwmac-loongson-set-clk_csr_i-to-100-150mhz.patch
