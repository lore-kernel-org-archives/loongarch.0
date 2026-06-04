Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2969F2FF67A
	for <loongarch@lists.linux.dev>; Thu,  4 Jun 2026 14:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584801; cv=none; b=HXv6LUJ1kyuF4f3Rn4oWM8wXWL36iDCVuAdO0fBALLNR7nbsQ7wYQ5p8cxINhbWx5Zmhzro2qSv+4HKY8yXRU9lWwiOoocemOIRpYL2eYw5CWO6LJISufxn18jxSZV2ZI5mVLzzvxn3AYdtij9HSkorttXXFj1OfvGdaVTAGk4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584801; c=relaxed/simple;
	bh=W6bmNTwVoxFC7OxI6tM4D5zk/OeiJNNPxnNeuVRx1cA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=D/upqmfRuxiXgFa8EePTV3Ycl6g+eV9FpFj4VW9yNFcBCZ6mCFkShKx3wAE+DEJA94QZ3VfeUH69eZFux7V6xVs+yDhyp6lKA2SAyWl0c945/r8SPR+vfx9A2FyA8+qMPQmVBoHegW2630ZXZh63MdL6PeEnzMKqDqh4i13ZJAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=NWrIbX4w; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="NWrIbX4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1780584793; x=1781189593; i=markus.elfring@web.de;
	bh=jSjJSkqtYvXUMxJkM3mpCI6TtWiO6NaH1UPNvrGCJAY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NWrIbX4we4VaQkUmZBxpwj1f9kDOqIXzIlSkJXcGtch+tKriWs0E7PNnL7rJUEN3
	 4SHbwLQT7/Znnwn9PuwmLnjSEFEGZwg+62s8UKwsQAVoFIK4tZ0OyVUeVAta/t/Sb
	 DLymXcEGjTgXn/kwBcX2Vy5qNi9s+UzPGqt031NkKEKN7kwT4WktFOBp+nwoyNvLS
	 5rSSAL3ZCHI4J8REXjBhvyR8Dq/uiW+d8lj+PXys/AbV9D0a2pb9ZDXtqG/nxYFqR
	 pmYeHChCT79yNCpTzs6glUDz6q2CHE3wBXW2MSSOFbzFdOmA7kcVlSfK+4o8sx1iQ
	 8gLJx0QaEFsq6WseuA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M2gkf-1wYjwc3W2h-00Camj; Thu, 04
 Jun 2026 16:53:13 +0200
Message-ID: <512f7a62-6f5d-46c5-b98a-f299616c8762@web.de>
Date: Thu, 4 Jun 2026 16:53:12 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/3] LoongArch: Combine two seq_puts() calls in show_cpuinfo()
From: Markus Elfring <Markus.Elfring@web.de>
To: loongarch@lists.linux.dev, George Guo <dongtai.guo@linux.dev>,
 Hengqi Chen <hengqi.chen@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Wang Xuerui <kernel@xen0n.name>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <c36cab4c-0a91-4802-8693-a6ae3cee65b1@web.de>
Content-Language: en-GB, de-DE
In-Reply-To: <c36cab4c-0a91-4802-8693-a6ae3cee65b1@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6jE/CaqGZ+nfgTwDX8J6GX333Mob64s+cylI48SK6o7UY2g3tbf
 2I7cLDhHEiWg/EZbBx2r+BpQkotIIPJeB2ECaRYmI6/MP6l5GvFKWMe7x2vV3mZtO4htpvx
 5L2aGVIVO2eXzq36+Sl9idmNs67O6BQB/RCWoMlF8rvkMt2lTYn5DN8WUhb08clwT86oltd
 kDpBoj0CDmhHM5kXcKQaA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6OHeOYYwFi8=;vNJwOTrbZc0Xnwiyz0NpT8Dv1SC
 XdvvKigocTX4RtLGGZk0cpBGUIDNqq5KWOCqnJMz5EoBXIhN/00vlDXGfkLgxh7aRKtGmA6zN
 +2XNt1oXV4hun8/GS4VhcbhW6umnQSDsYmc5rUt9Djj3LSbWZB+ibUjsxObhp4SKyY3SNZ9hk
 b/wdRf+HXEyHbGBo3NwlR5m8oAdovUO7kaSuJqzWIZfcwIvNDrvcoBh7iux3G3YQkvCnjHvDS
 EHCBInmW4+1c/xzxA4EftYJ8EJXMFNPudb41fXv7PFxp4Q/lOHygymho6QwXI/AfC+zTHP2w/
 CB7pBqGQ/weD3q4Rc0qQeGIVkuPZjep8ATXOepaSs2B2pIcIyhfcBjMkMfPjTLmElMLzxFWPK
 nPkgohZI7YGD2qX2mXrCAM+d38hnZM5fj/5+e7sGRyo0gPXXZDG1N52zNiNjnQppkLPtpdABN
 T7As4zbzSP25v7Hm3CrPozDD/O2d0+AoiXOtE/x+w3OsNl7BGvcCGFRy2psi9e9cpM7XmI2Y5
 uoMppFb9yLVj/C+6DMFPzHgcvdzjI/Ter7ttrQRPuohiRUpTQlq9F3hL+y3JLGFlXJ4wPVTYE
 Hx82dOVQiTJHtEkIncyth6BEDF0JMZi5P9ygO1LA/yMTIAUXT4yqsR6TtaKWjNYx/VvMmxxS/
 zU5p3qQwA3tdWoCdKBoPE02s7+VpKjJ34k5xA8jbxq1GRiKrloMjMoThdeKUiKgSonr0j4mEq
 yBi3os+lgSHNYPL4fLuPC4GEPwjb9h7AhGT4Dt1IeE4XZG2v6gAF6nBiP865z5ZUxyGLhp/IL
 alEIZ3afFZW5Je8oCVYenyVAwWT0+qwTKdguEPpXts9UKhhqvLI9H9vegAcDRYPFRhwyydAiW
 pWG00z4/B/gnsJAABm0n+wOj36TMNRdemhJygSlTig1xtjEuukYFsu/NloCkzRxpbQxSdBK9n
 92orNnsg7U0n85LqIOMfx5bGCjkNyUG4Y0zVmx20PvCssOPExTQLXxiiy8qAAdIp1+gwAx45i
 IfFMD65Xmx3g44aQ6iOSdnFA85RbTxvi55sXulRkexFsq+GsELKNNdU8Mj2uOh2vczaZ5Gb5e
 i8BnYZ00il6Stu9kEkZuFymGKd1tXJFlD9k6Mh3w3pycEaejyl7OE5LW0jdOqakq2IlO56U//
 k1vLQJNCMK2NF2ERU8qSotKw5BfqxMeXVnlneEKIUnCCiy0+kIlbSInv2Se4Louho1eeqtRId
 s7SKG8qIKO3W1xr3RuTWHEgRjnFzugnuMpEVao78H3f8KxSQOHKyBoGFHuSoiMMrxnUdV/Iz9
 yjFP42ALnMWBNmNMmtjesQ3VeIaY+wZOQ+2j0AR3DkHCtbDf1rZ9tMGLO2/CA1UPl6aowrBXZ
 Ns2+N5SMOzhM7kqcn/MUI8jkBKV3sACzSD4cg1g1wKBcciaXmLMLiBmlCRsHZ951vjnli+Gq2
 9S2HKT2HhQI90jTCgwh06O3nzlFnprEQ3pkzEyrnLw/ucTftyswtx67TtiCU7yq3lteUzaw10
 d/f8wpgWB4KQcm4NWTRyWCzR05rsDjGYUuqqsVXnDPlNcqfhgJE/OU/lM+TKlyK8N1fxvG3qO
 LD62uuhRFpdJGWjKjYXLaaMSAR7RxdDaOAMQ3cfKvYWO6NNpSQuOmfo2vYQ/G+lBju7yeM7T3
 mSiBe1Xu6echLvzFuLUx2Rr+MYXVdrL0Q+BrWUWk1FvT+snKd7pa+6cK+3btwzx7Lc4qvvCSU
 j8eDWW9RadsfuehphAkhJ/c5cJSyzRyqoHMvaYNA8MwHnYZ/TiPZlsPHC/u9/7BGRDn49ojUf
 WXzFZ4v0SwyBxUyQwHbjXGO1AAsvzpRFU6rpI4Cyn8tBhn8MEgaxoDoXZm3IC6gGZtP/gkUPq
 4MjgGMAJ9+MmkhRj5Q1zt875SCxFJkZhyQdyT8g/f484h6aysX+13t4sPl1IY9vgQ+tpk0+Z1
 loUYqYFdrJppG5mkoCEnEkjjEeJ5rQfMPTbXUv6HbLBQ9evEqdcz/fy6NLewpZRG+LvxjX+xG
 CKucXhWQZG3RufWsrdt1+EXOB4g8tWtwj3Woupgz3ISMJ+CCmMLy6UFP7fLKh6wnzNXA1c9Dz
 uoL2pNqVK2COqq+r0YGVuBfjvYSAJJ1fZK7v9PqxWp4CjFs53JMaIl9lZyELDn68GTqD8PhPs
 cyghC7UEFeJmdBptbJy7fCsWX7fxeOTJjUDduLMkXXY4OKg/VxhgtbBWkAdsBpe5HgOZo9xpJ
 F8D2ybydgzf3gwF7c2i2K5VI0QeNhTNsHMGZyv5oT884Tg6Ugw8BDKTNcjq4ItHbhvbJ8kPPV
 yan11TdbEczkeFXWj6UxxmDDyaljUIxuHqdYX/hJoUeQQhWggeMDyLSyv6/nUMoa7lDeZjy4G
 aSzIlh6c48E/yoRV1SD3z+5EKNCwpTj1YwEl3YrxRkhHxKgiDsAbDSUinIISVtxGdeN2W4YlS
 37KGk6ikPEebYGUD1H7rHjNr+eFOvbEPrcWPs5Hg7778C5F2kbWxGW7E6p44JTl1Ke3OM8BAy
 WRGVB0apary77Px2yO2SqjdmkUHtaDfaPRWzEhLMTUnvlIM3tj8S2uFkQB5SyXB4dEVCsAzBo
 WO1Dm2xDIEGYqs2QuYN8bqiwyvk6u8+A++M/Ty9RlEFuFofTH1c3V9HyyjRZlLL3hZ2rTnFl8
 YyBNv/tjNKzxL9GNYxS4HTJvMpGqim6FCauwAEGYVwhozGfpQN7uQerYS/WZSrR6lLfBRvUA6
 D4eWvo+dsnqVpjRZLNjfpP+SNTsUtzVQ/0SmOAB8bNrQxSXGoScvFjQ1ijtQkCJDedVBx2dXS
 4sxjcy/SlbEyja1cM1oE2tGQi2GY3Sy3GHuEhikHP4LMl1lSLv817dHc9Ilo8gxEVu2aJaaHA
 Siqu2w95JlC2dIgVN857p8klHquqNqrBwE8/LvkTkKAdAfzQ/Zcc9HszC4MOpFuPJzZKfNEKL
 lPjxAPfqnlRJaY4dia5kgFVJDM845ukKx0oWu00N1yUZOp4uGrDk36t5C0CWa4LyKsxBF31YN
 MMscGs9odiMMwl0kbY8V/KKGYQRjDbWcADx4T2u6ZIdvkAjyEeT1mnEAYdAbQD9s0i/BxRQ/E
 1eqS5xxfcpPbNvpwPteDPJAsUoe2RVx8PMdZOlh4sVR0DjWm3PNYuFpfVvXa4VFo3H3Ij0bRE
 SIiFVHTwjYLK9ORJaiFvZdzxiWfJmGLyDfs99vERaBjSFiDBO8d/WSt4pAnIzq03PbAUNGFM0
 XOHQT+OkqkSSzUPVgpTe1AxVuaQeSgnRkchuMxw57rf1C6/OMMTeOZoMpdXfWqTjXLt0+352+
 gdewtFwCTfdMgjOZboOvnnIafBSUjPy9MmR5iRpoeR3I2f26Zdr/OqqGtVLljzxa7QO2ImGP0
 8pnyEdxi2DW6jJtLT0a9NOnPsVEendyU2C3kVCGBYB75l3zEpy7kWNib1x1eN4HTWqOQnfL5+
 8VI4hOoop0S/R252vybsTZOcCs9QW1QpaK68UNOOiWFS6cR5OxwIApbJ4OPelbhmQfbZzAXF6
 sosSxJCUYwfyeywKNHICeqtFAHKe7gwzOwBqWSaotjEmnBPBoej2z9Q5aYnT4DEOOgqzKYBiq
 U9Dz/ZqLf0kskSBGoLGF13UG1CYHZRF3Y6ilHAdIeCzH8E/ZfyZ/N7bQivRdu7PcGbD4d2F6R
 oWUSuNJ2N2ge1F4CZfJYrHElvSsIV9MN3ZxpSFP1Tb3hFHb5uj0TkaoB/UWbw/mr0e2YudR5V
 CNIgNvaZkMtVgIXF2VxMVkUtk6OnDkqsRfyuZ3hLysIA4gWbojX+XqrBmkatYkHw1hChE2coJ
 yg4syvyfDhPb6kD2J2u0cgHfe1RuPB4nCiXOsnT3t4fSuGWXMVCUMfCe+oa33Nlb/P1VPGq/0
 n8hta8RAXuWxuBl3FU0uqArFpxHMPNHH92PWuoZeGtdhR3DeR9OgGBxmts8QuU+sdgX6qrzA2
 zTcbCXlP6X55ixeVILA/C5pjT1MvaCxo6UriWirYEAIS2+zkpVDCdd2131pIMkqwgQ3g+NHdo
 TujR0/uqIupR5VKv7Zj6Fpby0Pg0gyKfKaeU3I9VLBCfFPZtEBapE8DbG/AhY2MS8ECqdBmRb
 URwIEdmk3yFNK+lEaSdSffy3L/IcUIRkUGf8fMRTdg6rUafiWwLghjZJQ33nNKoYTm8IlyX+E
 Bo2f8bkuUJjGyNDs1K6QRmESDcsREcWCl8L+lipGs8Dava6ZD7lNEDnfJQ2Un8LuAuXTlAFYU
 JSSkyw7GTu7+3f8Tgamx6dvJG2aQ7gNRG4Yz2oIcv8VoQhmQD5Wy/XWv9tm+vGXxk3I2vL4gp
 i7MmJE+uq9wC9AygBnnqOH8agmz33KRPDnGW6r3g8jOJbIStUG1HMB4IYuKInY/FKwOAKvVPJ
 xKvM/+1YMVGXwf+umAcevCtsg9ytFLV1h5pfHOGgU7XXo6BzCH95eZXmfxZNsNSsHJ55yCeo6
 juvDLpZ9YnPSxwfUHVQiFPtI0acmIwFZq++rso2UtbraRghFz1kgXDR3FlhI0KJcVDyOe8xmT
 THz980BX1TeLMneB7hKXfJkBEdf8UtyYEIkAZpSZuA6F9qzmLUUXEwvfuPpVPAtlqHFBhhYHk
 R4sVvFMsDLOFgbuj35vH1/9RPTyNT27tANGlaF3B4JYVdbYL3B73JtYNivK0xaJTOSUErpTZw
 YSyap09doDwOdy4Ma9JB2wjYHavC34lgHnxvHKMGOkRFqZxAqbkLt2oGi+Pp3L1vMMp28F6oP
 PPIR6155ssD94/jsKQg5HHNamx6Ea961cGJuWo5Hx+Jwa9PkSY5iZTOytBnBPv4QwBV6u246J
 mxsjTjW1ow1DQxhL6UK4YyeSUZaBrfM5kxyxHEEh5dOUL92nT/OrGwDmHu7WOtEFhdELMnqfS
 eGuzHFT3DGw6LXODCga3rNCLnZ9NP4oprfDrxGXmYA5ri00NN3H67tRwkcz83HHCjtaTgKBZ/
 C7hgcqz7eoLwuNAQRZBTM7SQLagTRbYWQp6L6djYxkl+KRiPwaNty+1Z3xD6W3axL9tvd/Ka5
 jouvk7ZMoLvIqSQ5U4EnRYvrVYSZR6onM1snC5dvuPEu7wEijg2AvljRC7Qd92kNi386VISkT
 enmzZgVCegRa56pDrxsIPanLrVNLXFccWlbl0L9oRQgiyQO3BaHG2F3PBuaQ0ETU3BqPLLfjQ
 Xa9jXs+XuTzmduU1qckHtUxCYZC+Jfa68I3MKVsr5ln+Qgsj4588Wd70wcuHO60rFL5m3SIG+
 fiwQtfuqlJlk22tuh+yL5NT0DTaggpytuBYAvwHOlNyk37NtjQXnAxGo7VQ7broC1oai8Hfbq
 iMU8DgiJFcywX6WEJuEd5NPnIj4uUM8Ucw9MEBPE8i1ANzd/kc1fURSbbe+gqA+KEStfXMs+V
 sBTupt6QiJMPrufkDLZvH4WNa9irn54sY8vwb+7rXBHkggQRznFSihIaW64uiOExbDPv9zAtn
 gnXNhKX1qUhsg0Ie9vQTuhTaQCadOFLk+hloX9wQ9rKaT9KHqwg1GyS2fzpx4eO5EQCoEv2zv
 F/ivqRbOn5G+U3ZEI9v8MfXfTU5IcIjN5tYSPlGAAo/ABX3w

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jun 2026 16:33:07 +0200

Put data into a sequence by a single seq_puts() call instead of two.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/loongarch/kernel/proc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index bc1cd400025c..36df3c7f6990 100644
=2D-- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -57,9 +57,8 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_puts(m, " loongarch32s");
 	if (isa & LOONGARCH_CPU_ISA_LA64)
 		seq_puts(m, " loongarch64");
-	seq_puts(m, "\n");
=20
-	seq_puts(m, "Features\t\t:");
+	seq_puts(m, "\nFeatures\t\t:");
 	if (cpu_has_cpucfg)
 		seq_puts(m, " cpucfg");
 	if (cpu_has_lam)
=2D-=20
2.54.0

