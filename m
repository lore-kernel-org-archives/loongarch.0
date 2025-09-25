Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545DD2E6CB2
	for <loongarch@lists.linux.dev>; Thu, 25 Sep 2025 02:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758768447; cv=none; b=AqQg/p331yxQ+xL+tYfETSj2A8P2X5wm2tyPddARNl9i4FR1KrnR2s3BcXjUbTA0fh+V4gjT9GddJQTXeVveMhSi61cDHBQmQZz+Guhr8qxHSpXJc32NtxYluHNi+DGur82IDkiRQsB4b45ooafWmNpIzLkRuQ+g85gcJn0LRcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758768447; c=relaxed/simple;
	bh=19ujwnFXj88kacwo85PIaKscRN1Zn0ix4HoQX5JW+mk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=anIfJdRlf1pXS3uO6ss9spuGHZO5hI7fMuBRXwEFHbzZ1rvBGBkKHgwH2F3orkmnlRcpuwxJXJhdO0T9gdQj8wuylzvtt/okRHBqUoOkX9q3tgY97E6va5uFPnQw4sjejCtqm726+uJ1pEILBoJ3uLUROVbnFDpzZRoPiseKfeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=d1PH1lyP; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="d1PH1lyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1758768416;
	bh=oUVIgw1hSqZOvYR+N4LRnpAUQ/Srtvh3WmwHHoH7NH0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=d1PH1lyPpy/QlnSO1KC4JSc/WMYgddpPAJy4+Hr9LFsJU+o0qQVrPSQduQ1z4KVPp
	 Ee6PT4Jc7zCCXfQzO6mwjKYQOVBsvrvPcePLTeHT4EkurOue+8MkXArtY7xxr2mqUG
	 KdUXvws+DsawtjdEt+e0laTxAdu8WlHDVXAz4Yws=
X-QQ-mid: esmtpsz19t1758768389t5149b116
X-QQ-Originating-IP: IPWBwPHDWCio8nJn3Kphf0rZ+QSFAF3ARlWGDRkJ5Lk=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Sep 2025 10:46:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16810204573868226589
EX-QQ-RecipientCnt: 6
From: Wentao Guan <guanwentao@uniontech.com>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	niecheng1@uniontech.com,
	Wentao Guan <guanwentao@uniontech.com>
Subject: [PATCH] LoongArch: defconfig: enable NLS_ISO8859_1
Date: Thu, 25 Sep 2025 10:43:01 +0800
Message-Id: <20250925024301.1283742-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-0
X-QQ-XMAILINFO: OddG9bJrw+wO99H0+kBP8l/Vm8yAmfeyKKqyWK4a6sDgdCuKLHPkKyDe
	f7s4kLFnqhXoQgWQ9JRchVLwxVwNVGZsmjViMrxHOAhTNB2lpzIQGiCTzXgE/h0lcbr1nE/
	8G/JxTNvYHG0HU96QjtiKVGwOd02KsDJhhdVZzQEuMh4DPQ8wlctwhw9FECHGM978PRSvLk
	8+G1L9Fh5S8g+LnLCkBIFvshDPi4EDSaekpupJLuVTNcduX5hMxB9BmXWTuthElwzmqqJfl
	rOsnUesoy4EeEPbX8M+2EKEcH8Pcx3T/MdSbZvLhGtiWdr7xpeg4C6y8j3zQe4/jYP8g00z
	1V9cizYaakKW4rWoJogbD5NZ0X5ZWMTRqJV4krAXG6j6n0EIAV6WnqGYoRlYqH1CAcow7o5
	YQENgqUaYbCCPeb9jLrkRPM51th9ghqdhcBXTqDvDrASHWYDDNERrBXQtbWQxisD81xL6xU
	LQisI/BcLIiWBriUDNXSQxHAl/ZOD/XkLNugO8yKEmaQx+N1c2pMdWm+YHFZjZK4Kn+ani4
	DgHKkTdKcRXi5kqLp0KJgOEGzsWjRV2RUtqF+RTDUYECtzTM3LOt+x8m0jqtfzs/di2FSpj
	djSk3UDQIav+56ItTg+NSwY2+ifK0xpCDj3pmlNHLpUNGlwOgRNE4+zFfuykGRNBdxG7ohg
	UqVYColJsK3OK4keolTJiTuFuU+KmEJdo0qwQYcpg5o21EPVqqTXdV49l5vY8nC7BrHjolO
	xsObgxnQrx6+Ni/lMd3c57hvNyqH/oY9cgbWMBrMPPn3xRAUmE43xXCyMaPxxpnLoFWwK5W
	JE2CZTDit9D0IusSky3T9c6xvQSeOQiBIKD+We2n4JNyulXXn7k6sJVI86r24u6a8riTlLP
	5kEvsVgWbaZ4q/lleGvqSWDKJMT48pPiS+ii9kx1LwRYtf3h+C2FWgj9DZSCnzisd7J4EVO
	hiMYd7GXtpoYa5QsItNGn289Nh69fMoh7nPFXnFyaWTivDKGykyGkqTiuu7u3aXCQUPs+mz
	pTJbGgDi8ujdHiy+9IDFxRnJ2lfriGKKQMilVvjnbPZ+gmJdxI
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

NLS_DEFAULT is "iso8859-1",so enable CONFIG_NLS_ISO8859_1.
To solve the problem that I found EFI partition(FAT) mount failed,
systemd say "Failed to mount boot-efi.mount - /boot/efi",
and booting to emergency mode.

It is similar to commit
efe1e08bca9a("riscv: defconfig: enable NLS_CODEPAGE_437, NLS_ISO8859_1")

Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
---
 arch/loongarch/configs/loongson3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 34eaee0384c92..b1dabce266e9c 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -1030,6 +1030,7 @@ CONFIG_9P_FS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_CODEPAGE_936=y
 CONFIG_NLS_ASCII=y
+CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
 CONFIG_DLM=m
 CONFIG_KEY_DH_OPERATIONS=y
-- 
2.20.1

