Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0228275108
	for <loongarch@lists.linux.dev>; Tue, 15 Apr 2025 07:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701125; cv=none; b=J4OQzPlaRkqGED0jKpI5oan/stRaN14xBWcoqIOmHOxr7L9Rp7OH8w+nCKRancg4VQi3+LAYeaW1LadwTSEGZtVBjmGCX6m5Rd5P/LY+TS9zMRtLmEcGuPkkCk1V5yHzVT/vTOlEw4Cw2HSkZOAfI6EcAQoDaXP91Lu+LWK/8XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701125; c=relaxed/simple;
	bh=LI88EEgGawQvc8clSzxh5HnU+bAk0x3wFOLx2hHY2gk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FtYOni61Yvl/VY0yodcBwMP4FX2OVW3WgNVfUQpTHsC4kPczpPionSBcK3e2HYKtQOuL56hLc2NEqG082ihYrov9y4Gof2XSSxf62DFRo/I93KhOAsUGrynl+C7SaKJlcqRxhoZrsceH8Af4wmKJFvXTjduHw/uYkhIJSZ9uln4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.238])
	by gateway (Coremail) with SMTP id _____8BxrOK7Bv5n3om9AA--.13029S3;
	Tue, 15 Apr 2025 15:11:55 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.238])
	by front1 (Coremail) with SMTP id qMiowMBxGcS1Bv5ni3SCAA--.35528S2;
	Tue, 15 Apr 2025 15:11:54 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Yanteng Si <si.yanteng@linux.dev>,
	Feiyang Chen <chris.chenfeiyang@gmail.com>,
	loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	Biao Dong <dongbiao@loongson.cn>,
	Baoqi Zhang <zhangbaoqi@loongson.cn>
Subject: [PATCH net-next 0/3] net: stmmac: dwmac-loongson: Add Loongson-2K3000 support
Date: Tue, 15 Apr 2025 15:11:25 +0800
Message-ID: <20250415071128.3774235-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxGcS1Bv5ni3SCAA--.35528S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GFy3uw15XFWDtryxWw4Dtrc_yoW3Zrg_ua
	ySvas5XFn8JF1Iv345Xr4rXr13uw4qqw4Y9Fnrtrn3Za4xtr90qF4DCrWDWF13urZxurnx
	X3ykKry8Cw1xtosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbVkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa02
	0Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1l
	Yx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWU
	AwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
	AFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
	A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI
	43ZEXa7IU8hiSPUUUUU==

This series add stmmac driver support for Loongson-2K3000/Loongson-3B6000M,
which introduces a new CORE ID (0x12) and a new PCI device ID (0x7a23). The
new core reduces channel numbers from 8 to 4, but checksum is supported for
all channels. 

Huacai Chen (3):
  net: stmmac: dwmac-loongson: Move queue number init to common function 
  net: stmmac: dwmac-loongson: Add new multi-chan IP core support
  net: stmmac: dwmac-loongson: Add new GMAC's PCI device ID support

Tested-by: Biao Dong <dongbiao@loongson.cn>
Signed-off-by: Baoqi Zhang <zhangbaoqi@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   | 105 ++++++++++-----------
 1 file changed, 49 insertions(+), 56 deletions(-)
---
2.27.0

