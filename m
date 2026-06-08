Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE401632DD
	for <loongarch@lists.linux.dev>; Mon,  8 Jun 2026 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780936291; cv=pass; b=bXRp8P2Cj0sdn4Jz3UrIyTOTF7yHzjJTzC8ZKXcwdbO5ciQGDiU+4vBszofcK7zwPfRX9Z/wPRQQIuOYIMKac+SDOaHIgDBZbdqoRJUYCWFc908YDnN8dnzY+/+H0foR5kg6uKfPQzV8wsHYPx4+Os7FjgBnEDn1GJELv8u78Ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780936291; c=relaxed/simple;
	bh=D8vFpN0hJqf9d/gKvHxzQEYWamJuG065TsHkAT3J59s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5d1lZAULBcrn2azn6lz5ci8vUOlcUHDenZURCx5g8NpLa+dd7lNvmMnB6YF7weuTmsYFpf2PTEBQbzo++D7XsVVZXTou4CORPIp5ORdBHqboWcXl4LNEDyHPabn83v0127zVWTl0W/rvvJJ5U5GSV28K5CORkj+oijccC5SJb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKUroUnh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aEk9YaB1; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKUroUnh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aEk9YaB1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFTDu3552610
	for <loongarch@lists.linux.dev>; Mon, 8 Jun 2026 16:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Dh0My5XPTw0EtAcYMuaP9DIqaOn+MAp7VRpz58CInTM=; b=bK
	UroUnhkz4pKQ36Eqx2OGDhGkz7J6Re/8ZFD82X0RehI7Y0MGj8NHovKB/97jYISn
	fudrob/coutlI9v+msh9ROiWhUMQ8PO/M+dKlF0civ+oQsu85Ade9En7qOvTf8ka
	Kb+aY7g3PrKtluAcX6wpYzIzOLTDqPDc9qgZKUlxWZEXfNJ2CU85gD/6FWG5IWUF
	bo0oN1oSSu5ihMosfyOpGFYaVVXxWPRbQDBfVYtWCirjdLKRLAFxMPbnEHWfJRm2
	GvSPIoVqBJKrLAJ6igEQPSCeJZarVZUJQbOkkhXfmbau/+2UV8zwUObFZ71lIRTA
	dKV2VrrDJz5GcxOhOv4g==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuna9ted-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <loongarch@lists.linux.dev>; Mon, 08 Jun 2026 16:31:29 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-660575c74f1so8674869d50.3
        for <loongarch@lists.linux.dev>; Mon, 08 Jun 2026 09:31:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780936288; cv=none;
        d=google.com; s=arc-20240605;
        b=GbAq4e2LNEw/FteClDYKwmYxE7imLuAudFcPsrt3VyWv86jyQ2M0L/+I0lGBwY5sXr
         jiPU+UvuaQzPlvcDClk5raBhpjHH702zkn5BE+KY6dTCM43X1GDMzwPPWEdhtUQMb3cu
         ELXhWfNrMKoZ57dKy/SVJ/H6NlSyTLqFkqRA5HCI4Ng1x5UFD6jxNg/EikuBcsJOziaW
         hDD1NcjtCn/VcxYbh9DBp5AbY3f4jijpmpwqqX1KArBnkNZpBU9Lo+1Pzpe34ExaTFES
         t0JfKdgHKb0q5Jgfaj8yvvN/LQHpfEh+z0ZxeLrvp3aee+i8os8YL1twiaT5INFRgSLc
         2BQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Dh0My5XPTw0EtAcYMuaP9DIqaOn+MAp7VRpz58CInTM=;
        fh=Wuj7138cRZtedSA8zrLkZOveGVXaAW+Cat6F+VRMUPc=;
        b=JK1EfjGXM+/I+90tgj0Px7uX3zqwTQ4YhVIJ9AqEyshmDjhp12uT8y5SwSwKh76x5Z
         VGqBuGF3YloKKkGfDGJGnvsWc8VcHYwD36uDLZtPCaHIhOKfkN3Frwd47qxPMOJUIGfB
         819K4yNx5XL5MPySQZryJv4RLmYxLVhHvVCYxo5a+3ruEYR/01OoHHfUeVfoSYcYpLm1
         Y+WEHkk7brU0Mj0OUy1ayciHZ3KJP7cisqHdK37IxW3U4wnvQoplRBSFfJjljp+w4XcF
         2CtIcQXKY26j3YUhf9NIYKiMM/ge6KNTp1RSlQCU3mCffNvG50Pl9CCfljyhpd++5HI/
         i4pQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780936288; x=1781541088; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dh0My5XPTw0EtAcYMuaP9DIqaOn+MAp7VRpz58CInTM=;
        b=aEk9YaB1QWQcB522QNQlky5pkPlfLQkoowZL1AFqKDWdm9mKoohLjW2o/A69MB8izF
         ECI6kfvTwXzWXVPbCSj/mN7hAQvDjHb1+TWoJg8RclLVEUxyU0L6KdPQ++Ylbror8h4u
         ra65cNWxvJyu4DpNgvVknNmWWeR+t1imGZL0daBeTK/jRHnbKX8+WFppi/PG2K/ZigM4
         P7YUks7LPw3/z8DYW7tYRMrNbuLoCGAQSG8jbIElcM7YfmM6mOumHum6EJ0G33PcFr9k
         74avhZzQyLkMsB+bGgscZEk/AjFygzMkWbQDyzNHopPpIGcRhbWQr6iQhIo0FJXIHH2q
         3ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780936288; x=1781541088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dh0My5XPTw0EtAcYMuaP9DIqaOn+MAp7VRpz58CInTM=;
        b=YKexyoovyxApNiHHUc8oWC+tpej4jECSbEOI48gYj4cciF7S7qoRfkRmMacXRjLEOw
         LtPwQLRMu+Rqc0Pc5Ght61/nPRfqBJDBl+A7OHvRk8K7iSOnZNTUdNEDVsxQZCdkl0Pl
         tuIp6MgwiuznaReqkxmdvsQFiTO3BB4fYoSwmxH+J8gA7+LFHpS/wIYedOtVUS0rrwhl
         vJDBjT9XTqZrjmGvzKytTfg5NyZNvn4XqVharASTpwMUTxGVJe8Y8P255pPs/HFKbRjB
         jqtr+22pOYnmQU76ckg7wuKEr25ZEbZPtXNhL+QUv4yxIvoybXN5K+3/XMVD+A3mJtRg
         NAQw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZAjZ4anJjESry4b/EbTcovMbOGcDXUw1coLu21bcS3bT7tjZffdFpLSdoDSuehLz+CPyfSKrmn5I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwF8tk8XA/xShbTAr2Nbf9Aya5oO9kXWgBarLnY+qfJREm08I3b
	GKG0QbCuWnMWK9RwRqvbsm3apoQnKcdlmJ1WZqu0yOYIoLsjn94CZT6bbeZQtYyR562tog23FDA
	dkW9lKVAADrV5awsiD2qyNt129IzxfXo+97ohjcyqd8Zxkr7Z0csd8uVOfAvEyJxZ4BjD+mq7AZ
	dDUUBUwTRIrMqMDvSiXWSmAG5nCcR4rbCJM8E/Tg==
X-Gm-Gg: Acq92OGKl1iDIKXVRBCAS3Gx2bKr19wFRlWUkbMfvapv2qHO7nW43CJ8CF9SuzTM3vO
	1+QHvMwb0xCIcBfc/XNPIH/RnMvNtddfmIDDCn3rfkRfzipm5F46qANft3gwXr+s/YGcENbJThm
	0M9WDe/d2LZ0LDLEdGHjfWevcHDcNauY3uzABQV4qv+EkXPzvmhIZUWItlagStyo6lcGr/XqT0m
	4q9vj+mi0DRSEPp2Q==
X-Received: by 2002:a05:690e:1919:b0:65c:1011:8a8 with SMTP id 956f58d0204a3-66106f38d32mr13567139d50.34.1780936288458;
        Mon, 08 Jun 2026 09:31:28 -0700 (PDT)
X-Received: by 2002:a05:690e:1919:b0:65c:1011:8a8 with SMTP id
 956f58d0204a3-66106f38d32mr13567038d50.34.1780936287720; Mon, 08 Jun 2026
 09:31:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-2-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-2-23ffa16b6ebb@kernel.org>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 22:01:16 +0530
X-Gm-Features: AVVi8Ce85oHpnPDkl3loJMYesa9hqOwx4u4ydQ5fzIl78S7nrYXEW2Qks7w8mXs
Message-ID: <CAB19ukFVPnWhgvb9icFU44L5qre8ViNTEHg_uvK5232PnCEE5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] ACPI: RISC-V: Check acpi_get_handle() status in riscv_acpi_add_prt_dep()
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Sunil V L <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1NyBTYWx0ZWRfXzJO7W8TtSrdG
 mVZNmBm6TGE28bHOVrgY+tBX8Aq+rdbmFf2HJD42+pOiZCiv22ecgWk9Xqqd/waAZdKUyEC6Lcj
 EeHVGtDZP7hfMyr85xUicowYA7+Z5Vgd+yp/c24DeylCgSu33k29qritV38gYv5YHHzPzjjPkeL
 CgckYrxbdnPMU/6OxD8b5qKB+yWUA2R64L9KVJUxrLbruldHcDGnJG2EMiLrIXfNXEKk8Yv6dsK
 Oaapf31q/oga0b7u1+kzoUNjzkA2vYGLy7cwhIfDxs90Nyo2V+VXPeI+PmtKsHgKxsl8Cwb7qmQ
 O5SYirpy5YgunDahxBwPO9xlIPGRkF6Q6zoFEmDGMFj1XP6EKKdC3/6JwQp8Vjd5rJpraYerlYl
 rYiUXfOZQF0EqJk8kDNy4VEFnoiDY39Q4tjsQFT95Rt4EeDdtm3vEhnsp1Z8snZnhMwgemoCctV
 oNm+LV+v+RM1u0cbL2Q==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a26ee61 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=bDdBU3oEAAAA:8 a=EUspDBNiAAAA:8
 a=S6Q6xKXrEcqShMHWKZgA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-ORIG-GUID: oNDRN3js8iS6aPiDtn_b6lx6P3bDjZhl
X-Proofpoint-GUID: oNDRN3js8iS6aPiDtn_b6lx6P3bDjZhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080157

On Wed, Jun 3, 2026 at 1:52=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@kernel=
.org> wrote:
>
> In riscv_acpi_add_prt_dep(), the acpi_get_handle() call can fail which
> would leave link_handle uninitialized.
>
> Fix it by checking the acpi_get_handle() return status and skip the entry
> if it fails.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/acpi/riscv/irq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
> index cd83c3035cf6..75170151c614 100644
> --- a/drivers/acpi/riscv/irq.c
> +++ b/drivers/acpi/riscv/irq.c
> @@ -339,7 +339,9 @@ static u32 riscv_acpi_add_prt_dep(acpi_handle handle)
>         entry =3D buffer.pointer;
>         while (entry && (entry->length > 0)) {
>                 if (entry->source[0]) {
> -                       acpi_get_handle(handle, entry->source, &link_hand=
le);
> +                       status =3D acpi_get_handle(handle, entry->source,=
 &link_handle);
> +                       if (ACPI_FAILURE(status))
> +                               continue;
>                         dep_devices.count =3D 1;
>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
