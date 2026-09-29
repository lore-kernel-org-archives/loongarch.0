Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7035275BC
	for <loongarch@lists.linux.dev>; Tue, 29 Sep 2026 14:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691131; cv=none; b=me+/LGZNfGFGXTivAA8wyv3nkno0Twz8LUfEVCRwrVe+cTjjDA0XQDx1KKglf9qOzYQBSqkW/1Ci2plRoJDczKIEwWvvH8uiIT2u8qq3Oh4b7JO5p85KzpQ3jtQyw4tFCJFTnzicR8gaIJDDWwOWhmSsi81xnxwwuGuWlvn42F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691131; c=relaxed/simple;
	bh=GeatX/mSgt8EYGKrJweaQ6M1vHW/l+J78fDDVRnanZo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A1JsDsW7+caGgUvfWpcDz4BwVmYmNT530vcQT/fnJ4AzgbBf1OBz0+SuxzmEiI3IYjBnJR4j2j0S82J4aX4mscmK9mP1JNM9inu+TD3b6WaAZkUlaJM62qjTm6d/je2vtC8BcwcWqTmxd1sVxKmuUrSeRwZA4HUdoVw+1KJwkRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fw+Bf7gu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fw+Bf7gu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790691128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2p0mpabVoWXtlpkN0tOfNpGONGhlkPF/zvbxue/ki/k=;
	b=Fw+Bf7guA/8CkttiPD1yr463Ph+4tyrM+ge0Bhwj2/c9Q7xhqgCveHlheM6CxKOGSJ/Fd0
	cDjnK3M3TwzFZfRcxE+4vr0XYOIiNfcmYBPkwfh23vBCuEZhbAtnGxa9hfuP/2rr4nKLEK
	iBMK8xtW5/G3zlyHPthQKg64FcKaG6Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-1vP5_aG7OimbTyoAwkZOBQ-1; Tue, 29 Sep 2026 10:12:05 -0400
X-MC-Unique: 1vP5_aG7OimbTyoAwkZOBQ-1
X-Mimecast-MFC-AGG-ID: 1vP5_aG7OimbTyoAwkZOBQ_1790691124
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49fcc575709so43177015e9.3
        for <loongarch@lists.linux.dev>; Tue, 29 Sep 2026 07:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691124; x=1791295924;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2p0mpabVoWXtlpkN0tOfNpGONGhlkPF/zvbxue/ki/k=;
        b=fdBPq1ODaAO/5dKWlGziMUyfNmL7/asBsvd/Uyq6h611fVAaQ6C3+iSdRojWV2ifPF
         wZcRiJaBiwkHIvpr4AqNjJP3N4Z11YOAiQSLKQ+Xu/FtenZIxvICOJuISIOV8eF2UQ9F
         qQEoEsueCPoT128Ojz8aMYU04mnBBXEY09BVNEynEO9guIE9cQiRZvfFbgi0mRhz8Xm+
         wEbiNIziJUReSmHZdbc3WwlSE065AtVwW2VRlLFOkImFgLtwdIaekGZOUzPSGq9LONRc
         ekRwr4sSgMvXJrm9BFBe1hmp9y/jcbV+QjusiSnlL6Un1PblxghjkyiplP8qzb0mDPuR
         MfeA==
X-Forwarded-Encrypted: i=1; AKwUvBxIBTMVZGZslWwY5NQm18Ju9UbtqRe2CkgJKsYxqzeEQ79Exrwttm4fi9OgB9UtwLu/vJBgkfKkEck=@lists.linux.dev
X-Gm-Message-State: AFuF++mpMJTUnNnNwsyUtv6ANPnuDCuSwdiyYJNL24oausqgCnrmdytc
	2mtNUnVJsNovFaQ1eY+g59g4xEsBWZrrJiVI8xkx28RcFDbw8gaavOvI4fqtaTlbvSINmwC7v+/
	60YfJNWsTjVrLjmN4sQDJ78a6eMWvWt18vEHBgRdxTg/ygbu3rpZJ1m6S8BN9qMCBcwJ14hv2
X-Gm-Gg: AYBFou08EQjAaRE1LvpHvTk9adTPY3JblZrcv0OROXY/mGtCv/k2HuucFBBq44OXaZl
	HdUUPl4lq3kXad9aIiGXJ8NuXRvQ/I+Yw5Q6JFDBieIW14PMjs91YopCDiAYp1Krv3/kpzAEaJm
	n6CNIl7UWmUG8SH641GIgiiNjHTAynNKWKYVqQWOHprPJA7VhKR4ya6p4eP9sIGahv4H5d84yKy
	Y2HhnvG7/FFcWN+nkHZC541WzQV4cgvGiLXve9M5iYxEgWNqdE5PcAyU+dQ6PCRrwfBDHz1qsnM
	K+tj/8E7DSRuULTTm7DQ1tFJSmA5jeBCD5/tx73LCtGLYMVpiRN6KuhiubcXr2gCyCZgEKDjOi7
	ghTbmuYLfe6A+2VZDuxmbjqEjxkByj0M=
X-Received: by 2002:a05:600c:46cc:b0:4a0:857:a3a5 with SMTP id 5b1f17b1804b1-4a00857a46amr82578635e9.16.1790691123704;
        Tue, 29 Sep 2026 07:12:03 -0700 (PDT)
X-Received: by 2002:a05:600c:46cc:b0:4a0:857:a3a5 with SMTP id 5b1f17b1804b1-4a00857a46amr82578175e9.16.1790691123350;
        Tue, 29 Sep 2026 07:12:03 -0700 (PDT)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([24.151.142.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013c64fecsm6760665e9.0.2026.09.29.07.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:12:01 -0700 (PDT)
From: Aaron Conole <aconole@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net,  netdev@vger.kernel.org,  edumazet@google.com,
  pabeni@redhat.com,  andrew+netdev@lunn.ch,  horms@kernel.org,
  kernel@xen0n.name,  chenhuacai@kernel.org,  tsbogend@alpha.franken.de,
  deller@gmx.de,  razor@blackwall.org,  idosch@nvidia.com,
  ardb@kernel.org,  tim.bird@sony.com,  loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org,  linux-parisc@vger.kernel.org
Subject: Re: [PATCH net-next 3/3] net: drop unused LLC-related includes
In-Reply-To: <20260928190800.2521749-4-kuba@kernel.org> (Jakub Kicinski's
	message of "Mon, 28 Sep 2026 12:08:00 -0700")
References: <20260928190800.2521749-1-kuba@kernel.org>
	<20260928190800.2521749-4-kuba@kernel.org>
Date: Tue, 29 Sep 2026 10:11:53 -0400
Message-ID: <f7tpkxw405y.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gtISIClnMQQ3j5rahh5aMbQX2kiHJ1QB3nmIlJGTps8_1790691124
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Jakub Kicinski <kuba@kernel.org> writes:

> The bridge and the openvswitch code include <net/llc.h>,
> <net/llc_pdu.h> and <linux/llc.h> without using anything out of them.
> parse_ethertype() is the one exception: it wants LLC_SAP_SNAP, which
> comes from the uAPI header <linux/llc.h> pulls in, so flow.c keeps
> that one. The LLC core has leftovers of its own - slab, string,
> interrupt and net_namespace - which it has not used in a long time.
>
> None of this is new, the type 2 removal has just shrunk the LLC
> headers enough to make it easy to see.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

The openvswitch changes look fine to me.  I guess it's just a minimal
header adjustment so:

Acked-by: Aaron Conole <aconole@redhat.com>

NOTE: I didn't review anything else in the series.

