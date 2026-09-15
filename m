Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14815441606
	for <loongarch@lists.linux.dev>; Tue, 15 Sep 2026 07:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456809; cv=none; b=Zq7DW6pJrsY/tVjjR9xxIOH6BMMa1uRrnFgclFtUOv+73aHFxlNUrPHidFA5FYfkaN0q+YUay4HMvt66hYpq186+P6F7T63n+WpktL1i1psE9L1Lm/D8EipDznJbdXnjnoaFwzf0Lvj1BulFe1B/xRl8ZDTA0jlYDGVDhmhSH0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456809; c=relaxed/simple;
	bh=01ysVpcOE6R2esRBaW2jUf1jKl/VdIRiVfhxn++neYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j8DXcdizOmCzXoOxABzwM34KLKbl6Rw+A1oQclOkiYML0ZKCEhEvMYvZSX1oUyynUek3s7vlKcyHhxxJlaO6NKo6qjhJ+b/WURX2PBseSp4B/sR9+hA1BbonZvzhHC7wmlpq/aSKxkb3fnBwQ1AAD6cZVEFxrW2abFFksBBwuFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fNhLWy3I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NzYGmKPJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fNhLWy3I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzYGmKPJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z7Xw2167822
	for <loongarch@lists.linux.dev>; Tue, 15 Sep 2026 07:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SehUk9k3CRKJXFemuL5gzZ7zkv1/5zSVASo
	RxDQ27qI=; b=fNhLWy3IXQ6E4lIC3bSqx4X+J76FF6WF61ZA7ngB2xj1xapYeN5
	BfRVHzDqpfQgf4oQ393ZXCI880pwUOmshrlouW9+aNb9qta+hcTjXaloBnLuxkZR
	uebiuNr0IxuP2eNegTY1hPir9w7M9mKhdbF6b++sZP8aWWrR7xzTMtpw3yk9GobQ
	tyFdrJcsmxa506Jrb+jneZvyVq4cYSwIeJ5m9DbjekShQ745+UNTBGIop65sdRCJ
	Wz2uRhDMLHvZYyAJ77cquzv+UbNu+gXdYP30SQNxe7jlhKXmTIGMk5Gm+RFxOT1J
	4Vf06pNo3oC+3h/aiB/JFfBFnJleCTklpgw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s8tv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Tue, 15 Sep 2026 07:20:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390a2c895bso977332185a.0
        for <loongarch@lists.linux.dev>; Tue, 15 Sep 2026 00:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456806; x=1790061606; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SehUk9k3CRKJXFemuL5gzZ7zkv1/5zSVASoRxDQ27qI=;
        b=NzYGmKPJPLMgwg0kCRSnOyLpg21Fn8AHqQF3LEruSTaWz4cXaWPQsbtxmOx++b9lGX
         daqXEqUnyvfZhxX6j+ob4flxQvYcMNAZ4oIX/R/nqWbAMbHhZXQHQoQDER/WU209YC+T
         aUZALK0MWfOPkuIj5fzzOCUnWinHqC6KbbjNKfELtibrxCauLZVMrPwsUPeLMrW9b5qF
         7mXOKZuWN8+ZtGBkoa/aeKT6Qa8H7PvXqKmzTOo4Z9o8BVPBhcIkpv8ok307Xiy/rX8n
         GyOeu5lxc7ro5+60f0i1qRVZB1fFOLzC7mBitC58hU1bHYLipGGhAfo1bVSasLtAhMoz
         JS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456806; x=1790061606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SehUk9k3CRKJXFemuL5gzZ7zkv1/5zSVASoRxDQ27qI=;
        b=VrmL8Ec7NhJKXZCs4hthREqFvOyrLALm6Y/h7O2C78QKiwb1591wh4HuvktDqD0VEs
         ePUFIJ12FTz7f9YZ/bw5IBPG6C9Wo8/ZGU/qN+ggM2IwC4rqm+VboVGvTrvnS8ZKX1+4
         mZu3c64owZx6wEIdAXAeZy/wH758ErnI85Gj6lWuxUm2ov1I/BZCA+FVSxAxU70ePmI1
         4YECN2MkO4GAHcdyKb5klLJVHmyCTRgHFw0aoYGiN7sv+V7fpqLbtAPGkXdB02RnlVdB
         IOTRgk1BnubVkjkGGu6KJdq9R9BBLkOXmgZEUmNJp/pQWKEJ/puEFP6vchgaKv5JQD/g
         PDMg==
X-Forwarded-Encrypted: i=1; AKwUvBwvXmRZ83Kxqo4HYz9HPfGvo2CSnr0/TOQPOTIHbYH7PCd4HYINQYxl9/M/nnz4vDB8S4gF/6hzUkg=@lists.linux.dev
X-Gm-Message-State: AFuF++m1JsNloY0vdWHfyN06m8XlOuclAmW2YtVr6eMjluZKTfXhGSXK
	tamTLBRXOTk2+KxlHdAx8hAwaCiPxtHzgDQ2rTvFBP5Oex8psCvAQcmUUK+inqPhyuCmKDGIN/3
	cQa68cokWRwsNnvCiosalQk3eMzPU1yNPCKdiKA19xk8ObHEplunTmTPALyRp6gQ=
X-Gm-Gg: AYBFou3u77Yee0tRJxA2w40eQy7e9epigWN4hTI9zTKDoAF7A//MlWHCtVPmlJ1AFeq
	UMD4vrIT101q2C642ru9sEe4ONwBwZoq+C6SbujyeYN5x6cagMVrQglDrB+v3hez7Unm8jpMEBl
	51XQaCBhhuApdlrcEyu50pMQ4bqv7Se4hXfO0SZB0MpHvn6qhjd60gTONAvCw2TfTeYUx+bt80n
	ttEILkeAEDmIkEdPtpXuy5fN4eH5WCDHJQ8XniPlNicht1FqWZCQbtnWSquZk862l9ehYfgunjH
	+mPDNlo/GI+3frJaj1G55UYRrCJycsFNUZUIGVcnwWlPeWl36s0P3wrFDgOB9pImEq6+HsGUc3k
	XdvRWD4iPJHjbpVQ=
X-Received: by 2002:a05:620a:458e:b0:936:ea0d:ffc3 with SMTP id af79cd13be357-93a29804733mr928465885a.22.1789456806177;
        Tue, 15 Sep 2026 00:20:06 -0700 (PDT)
X-Received: by 2002:a05:620a:458e:b0:936:ea0d:ffc3 with SMTP id af79cd13be357-93a29804733mr928463185a.22.1789456805831;
        Tue, 15 Sep 2026 00:20:05 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a9d1dsm52558805e9.10.2026.09.15.00.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:20:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        devicetree@vger.kernel.org, loongarch@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] LoongArch: dts: loongson-2k0500: Drop unsupported bus_id in DWMAC
Date: Tue, 15 Sep 2026 09:20:01 +0200
Message-ID: <20260915072000.47367-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=01ysVpcOE6R2esRBaW2jUf1jKl/VdIRiVfhxn++neYE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqPGg79k/3DTgj9mfp6dZvto3S7TYprOl7QaXG
 ycXfC0ly0+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqjxoAAKCRDBN2bmhouD
 14BJEACIG5O4D6Y/82v5a81YQ+E5215/HHIm2xtpQ7zEcuv0wkf49rvEui48I+d6wIUHtbqWoME
 1x/H1ujHXS+Bl/4g+PjOYTj7wMItPe2JEZC/RhVwVeBFE+nqzN8stsDG9ksJqoedmzguawQqlMp
 y64uLMz4pQniqsbusL/lGrDTGGB4493JCb4b/E4+5pHQwhq7zf38JQg9cSeHNDI+ewKNFR8Rtak
 oSgO5T0fYElXuJ5eTbx3wC1Y8kn+Vvygi1S48BHMPdeNB2299IEVATm4ylvMQluq7fjUvdO5bfd
 /0KcxLu5dJcC51w7QMNtNhaZNJxAWR+1Fxi9ist6h2+RHIJJK0NWFiHBdsuLrBtS9SH7yqv+KNU
 f1/rnLQvRFT+G8sz+egwubfHb31G71Jsli0OvjmdSzFaRWrr+LE7IAb8+1LgYkcmUHwTZG2GkiI
 2YqTpfS4w4CM+FI7LzVIwpQCeYirKUurWvHKteGrOz5/5C/duLVuR5BucJuGJ2PsSr20zJg738z
 9xT+UTclXxUQ/geoCdgyvY1B4N0tZugc4htwidwnI3zc1uG0+5JfQy3Dl4PaAiZ512TBu5Hylc1
 DU96VdffdLvZvIFUVe/GHxOj4YlpvO0j8nOAINitd0bg/unplgLS2llB6Ug8aEaCJ8pQFkJmkw8 UsbaXH3rExc4Jcg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwNCBTYWx0ZWRfXwaBJNosUn5FJ
 rZZMrnFFOk4xlbbA8cuk0BhmesM2/WTk6bfS2iE5FH1dyYsB9EAF4NGHyJLEoW9jdDv5zKFSHgg
 EHZijubq37vbhj58Mrvct4YmzxEimk8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwNCBTYWx0ZWRfX6zHRHJJmqbzK
 xG3EbfEvaSZK69jpQumH1Ay4VtUrDCWWX+R8blZSvgGm/JpemeDf8CVzev2hGuTh47g8Y1Xk3Zt
 iCSTr+K3xQAfYqYYnOufuY/RSFJ1u8FGwPhSnzG4vCBJ2+kK3nlva29e/r/Zg8/h5JB0PdjKT2b
 uMf9o4ygwNrgR44lFDOJ1WyWp0w9GNZuJxe9j/6bS8gLNW4tQu8rd/ZAK+ogDe3+5w5+A7Dd65l
 QPzEcHxgR2ld5rEQ3nguxB0ifv09yU8QKf1f1rHm5MhNyq67LnT+Xd46Mm1L13HObPt0ZqJjDg1
 ++DrNaa+frkmZAAkoXpaqt8Q/QG3XqK0QfbJM9vbTE8gRHHnhPl5M+7P2g27R3NUFWwVW3+nJHN
 4csnEx/Ns1MomXeh0PQoftQyC0EGAuvyvG3J1HObW51cgX6vCAAY6P1hUBIoLJ3Brg8fVcArams
 dhbko08L/FJENOLCt/w==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa8f1a7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=RHNxK20dIsJZYvHncwQA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: oJmBaAuKms9fOq97_9b08iIEePf7Jh8h
X-Proofpoint-ORIG-GUID: oJmBaAuKms9fOq97_9b08iIEePf7Jh8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150104

There is no "bus_id" property at all defined in the bindings and new DTS
is not allowed to bring undocumented properties.  Fix dtbs_check
warning:

  loongson-2k0500-ref.dtb: ethernet@1f020000 (snps,dwmac-3.70a): bus_id: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/loongarch/boot/dts/loongson-2k0500-ref.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
index 7ace54c84244..d2a3ed9fa578 100644
--- a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
+++ b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
@@ -73,14 +73,12 @@ &gmac0 {
 	status = "okay";
 
 	phy-mode = "rgmii-id";
-	bus_id = <0x0>;
 };
 
 &gmac1 {
 	status = "okay";
 
 	phy-mode = "rgmii-id";
-	bus_id = <0x1>;
 };
 
 &i2c0 {
-- 
2.53.0

