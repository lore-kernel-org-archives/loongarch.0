Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834D5466B72
	for <loongarch@lists.linux.dev>; Wed, 30 Sep 2026 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756151; cv=none; b=Fuxf/LUJKymnXgnm80IRrBMlt83T7mdr9T8uF7Ty2sua1WmPb9yt6LaM2uNirWDNaLAeWRKbKNQIiK3fIMQMrGDRsIPzpav4HnyvvxlG06cvIR/5Qo9EIxsik8194xqxJmvnnazgMYY2YnSeWLsv2NG3fq9T1m6Z7WcHla5gzUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756151; c=relaxed/simple;
	bh=hGf5SHT45QhXMybO439QDD/6j27QAPiOqO8zt+9Fe7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RfWsYZ+62qUZE86crdGWqvilJdkJgf4dKTBoA4QQnerk9boQDeImJbrdrP2HqCClbIY+KQnrb0sOzSb9pkkrIAcv9d/Ey3lpbGvALB9cwPdeR7DYP6lSXOA7jvIPKgetAcVCiydwKcd0qEbAS3BNbIWwxFtOb86QGtATjaCdeoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=LVKjeULh; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="LVKjeULh"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afd5b1678so339192f8f.2
        for <loongarch@lists.linux.dev>; Wed, 30 Sep 2026 01:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1790756147; x=1791360947; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wA9u/pcTwn6WeT/1p6tUVMcz40b3lP8bbas9LYvDmjg=;
        b=LVKjeULhn4caoaqPBBynwwul6qpW1iiPIbeGzpLVT4j2TGrJ6Q4LcPVB1sQTk01hYe
         lfze+VoUWdGi4/PmmZQJnQ/L8PuEH5aXBGsSlb5cj+9qkyM8x7JMqllBz8HuBKYjRefo
         5e3wS4jaK13tPYRYkDZDt2qHOYU36DocTkiZaVTKgp5hVHVoBtpgD7jVy67QABKHqMNT
         NvLYfyZLV+PuDsG/Gj9uXQ4MlLqtwbeyYw2vHiQCFRKdmijaoBM8GqtyGpkcBjp1qE4c
         gYre1t+gr+STWLajRYqyptSLMiMaZpyIttFSo81Qqc/f/NHnyFC6JjrQjfl4PbCo6xC3
         ertg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790756147; x=1791360947;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wA9u/pcTwn6WeT/1p6tUVMcz40b3lP8bbas9LYvDmjg=;
        b=e6OmBS+05Dzi45DzTXKub5PXdHNhwJRNaJxJXVfHtcY5cfCzCIrXRORyFpkUY1e3zN
         7E+vthepC+zHWP1AXvGKYk9NjlF05KOkI9KeHmpTJAAg90BbuSssLhs7WRi8lx6rQpgQ
         39Jb8Fwu2pOHEoeUgg6PtW1fNeDjBvBjVZfKoKZXIsQxr0tO2geetCPYi16wSrnPZM8R
         GZTEqzQnCR3AJkktAQa8VmzJR/IeAsJp82Z0CWXCdbN0sYGpPonUgsWhJ8V7VbCnO1a+
         OsXwj+vBm6GeUtlFqXbv7/dSvX/EYgrtxv5K42dcLI47GefHetd98FWctQzCVEIuD1OT
         a1kA==
X-Forwarded-Encrypted: i=1; AKwUvBzbdKvPGJZtzHIsn1Dbs0R/U+Ld66KuArcTxrlJnn1qFebUCjXL2Bs+MZmt20tHU/8InRJFh3bdg/Y=@lists.linux.dev
X-Gm-Message-State: AFq9FYJAA5gGUZRwpXGoxuYj/WFzhqhmZmoUuW+W4A9YOLuVPDL9LKLT
	Ut4KMwCaqM2ZAr9q5DthDYi+9Em6zmqbRgm/gvM/SThr5zacLEqktH1c+GqbsoctRAA=
X-Gm-Gg: AYBFou08b6A97h51k1xyaslkvD4bwWMkGJ/Jct8ITwVQi1zLAFVMXp3XbGXkc23iNzE
	BBkniRVb7YwZZtKul6G5oYKG3rv37yX5NIujHsNRuJC73afKi2Qq8WH0SyKjXWcbLnnDWKsBEjq
	gUZpnD65XbifZkqVwYmObAWYtzJNMdULVpIVWSuRVmUYd8YH4Lgi7OXMdigX+EGgCfcf3x4zt/1
	zk9Pk02JMLnSKS7rX7gxuDr6QEm3Yq1/K2c2ERNgCBxpVE6vFd59I2SGvRjteSkS+n7hoooyfAa
	ZUbFku7uexejrd9lahTW8Qa6o+b8aGURnh+YpeBWmeKkiBHZ0ce9ur5OD0wlutWuhauim2gbjKx
	Xfp9KY9lwtXIJxTfXZrLRvHp03Rj8vGhss19V9WvB/kbKlxYOd/ifxg0Q8zklGWNcovqcVJcvKj
	KfwDvXI7bdMlfzGjPYHD53fhMfyKCm8nEWY8fhdWiC0h2fs5v95rv6X8UxbR7E1PEz/1zaRAFQ8
	wbtikaozrLqHoVl+HQqAn4xZaq8EhWTDsbmlOQ=
X-Received: by 2002:a5d:5f92:0:b0:488:89a6:b37b with SMTP id ffacd0b85a97d-48b02525e7fmr1290363f8f.43.1790756147193;
        Wed, 30 Sep 2026 01:15:47 -0700 (PDT)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029e0e16sm1679272f8f.17.2026.09.30.01.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 01:15:46 -0700 (PDT)
Message-ID: <4e71fcfa-f733-4c4e-ab98-da8cd0531a02@blackwall.org>
Date: Wed, 30 Sep 2026 11:15:45 +0300
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/3] net: move the type 2 sockets out of tree
Content-Language: en-US, bg
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, kernel@xen0n.name,
 chenhuacai@kernel.org, tsbogend@alpha.franken.de, deller@gmx.de,
 idosch@nvidia.com, aconole@redhat.com, ardb@kernel.org, tim.bird@sony.com,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org
References: <20260928190800.2521749-1-kuba@kernel.org>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260928190800.2521749-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/09/2026 22:07, Jakub Kicinski wrote:
> LLC2 sockets are admin-only already. We have been getting a trickle
> of LLM-driven fixes for these, even tho we don't know of any active
> user. The code is so bad the LLM fixes just turn into a never ending
> stream of revisions and follow ups as fixing one condition reveals
> 5 more bugs. Let's move this code out of tree.
> 
> The series itself is LLM generated, the LLM was also nice enough
> to generates some tests and validate that the OOT module actually
> works.
> 
> Jakub Kicinski (3):
>    llc: move the type 2 sockets out of tree
>    llc: strip the leftovers of the llc2 removal
>    net: drop unused LLC-related includes
> 
>   net/llc/Kconfig                             |    7 -
>   net/llc/Makefile                            |   10 +-
>   include/linux/llc.h                         |    5 -
>   include/net/llc.h                           |  108 +-
>   include/net/llc_c_ac.h                      |  180 -
>   include/net/llc_c_ev.h                      |  217 -
>   include/net/llc_c_st.h                      |   46 -
>   include/net/llc_conn.h                      |  114 -
>   include/net/llc_if.h                        |   63 -
>   include/net/llc_pdu.h                       |  379 +-
>   include/net/llc_s_ac.h                      |   35 -
>   include/net/llc_s_ev.h                      |   61 -
>   include/net/llc_s_st.h                      |   32 -
>   include/net/llc_sap.h                       |   26 -
>   net/802/garp.c                              |    4 +-
>   net/802/psnap.c                             |    2 +-
>   net/bridge/br.c                             |    2 -
>   net/bridge/br_stp_bpdu.c                    |    3 +-
>   net/llc/af_llc.c                            | 1304 -----
>   net/llc/llc_c_ac.c                          | 1448 ------
>   net/llc/llc_c_ev.c                          |  742 ---
>   net/llc/llc_c_st.c                          | 4940 -------------------
>   net/llc/llc_conn.c                          | 1025 ----
>   net/llc/llc_core.c                          |   28 +-
>   net/llc/llc_if.c                            |  151 -
>   net/llc/llc_input.c                         |  128 +-
>   net/llc/llc_output.c                        |    3 +-
>   net/llc/llc_pdu.c                           |  366 --
>   net/llc/llc_proc.c                          |  245 -
>   net/llc/llc_s_ac.c                          |  220 -
>   net/llc/llc_s_ev.c                          |  109 -
>   net/llc/llc_s_st.c                          |  177 -
>   net/llc/llc_sap.c                           |  437 --
>   net/llc/llc_station.c                       |  120 -
>   net/llc/sysctl_net_llc.c                    |   71 -
>   net/openvswitch/flow.c                      |    1 -
>   net/openvswitch/flow_netlink.c              |    2 -
>   net/openvswitch/flow_table.c                |    2 -
>   net/openvswitch/vport-netdev.c              |    1 -
>   arch/loongarch/configs/loongson32_defconfig |    1 -
>   arch/loongarch/configs/loongson64_defconfig |    1 -
>   arch/mips/configs/gpr_defconfig             |    1 -
>   arch/mips/configs/mtx1_defconfig            |    1 -
>   arch/mips/configs/rb532_defconfig           |    1 -
>   arch/parisc/configs/generic-32bit_defconfig |    1 -
>   45 files changed, 33 insertions(+), 12787 deletions(-)
>   delete mode 100644 include/net/llc_c_ac.h
>   delete mode 100644 include/net/llc_c_ev.h
>   delete mode 100644 include/net/llc_c_st.h
>   delete mode 100644 include/net/llc_conn.h
>   delete mode 100644 include/net/llc_if.h
>   delete mode 100644 include/net/llc_s_ac.h
>   delete mode 100644 include/net/llc_s_ev.h
>   delete mode 100644 include/net/llc_s_st.h
>   delete mode 100644 include/net/llc_sap.h
>   delete mode 100644 net/llc/af_llc.c
>   delete mode 100644 net/llc/llc_c_ac.c
>   delete mode 100644 net/llc/llc_c_ev.c
>   delete mode 100644 net/llc/llc_c_st.c
>   delete mode 100644 net/llc/llc_conn.c
>   delete mode 100644 net/llc/llc_if.c
>   delete mode 100644 net/llc/llc_pdu.c
>   delete mode 100644 net/llc/llc_proc.c
>   delete mode 100644 net/llc/llc_s_ac.c
>   delete mode 100644 net/llc/llc_s_ev.c
>   delete mode 100644 net/llc/llc_s_st.c
>   delete mode 100644 net/llc/llc_sap.c
>   delete mode 100644 net/llc/llc_station.c
>   delete mode 100644 net/llc/sysctl_net_llc.c
> 

Reviewed what I could, generally sounds good as well.

For the series:
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

