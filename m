Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746343;
	b=H7HlJuwff1k9zgXuUE+8qcvrAA14RTe2nSF2pjmE3J+NlFCKIJilAgpWc0jE8thX+uaM
	 5jFPL1HWO1JwBZD6EpNXsKwuDYMqReb0BNAHsCBIjOnTDv0b1/C8nwKrU+0bz1jxJm4Ad
	 1m/xGe/A5A4aguWRlu07D5V65SPV9zBqGszR44bpZdUD1+HYgfhoD49EwrAaIrfTOaegr
	 Zz6YW5jCdeBdM53s5ZstbWoIjnZx0ehgdOkImbQ7MfkVtgN3Pjhx7UKwDGrqviuYGZq/d
	 9OsuDpmMntr42Ol95SqmojbsGvr9RFmfQtsWnQ613U2ZIGygcvGlzuexG51JTJ5ZCkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:To:cc:Subject:Message-ID:MIME-Version:
	 Content-Type;
	bh=BOL0EtHUX3uQCewXy+MZOW361SXm/+7BiPOyQwwic7Q=;
	b=P5i3Do0x/tHbyihn0f79nwCTutFrvk4gHw835bEkJX24UOVPj0bbFkxLXnAEQ1FSt8fe
	 B/pUrLohype76uj7zVbUEgcRWmuM14yAfyR367Ru8R05KlodQMpnd5wE+AzL6Y2vAw4qz
	 99VUn7GNkwWcPINb/Z23Dod3U3noExvSn4h2+3NMw/J+t7FzoWB0Ysxwph0DxhbfP/w58
	 nUuJdmUKZnktE2D5T/XFMg0GejgTDv9KyJRRL+PzSgXrwy3Sz7kSdw+YXlllAxKJ7RgFu
	 c6o6p48IKIBjSeq5SFueEtBSjuEw94hZ9Az8Eg2NBjc85/KOCQ9D2rd89i9WGBQT9Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K++qPZBK;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A2B606A31C
	for <loongarch@lists.linux.dev>; Fri, 27 Nov 2026 02:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A2B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K++qPZBK
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-385c497bf94so6831221eec.1
        for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 18:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746342; x=1796351142; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:subject:cc:to:date:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BOL0EtHUX3uQCewXy+MZOW361SXm/+7BiPOyQwwic7Q=;
        b=K++qPZBK6A5gMRj0LoBLkksoi8/yQSlGE3XBCc0mc6b4XlmBFdG6vOxRZ82/OidbRD
         4Q4GuphbKUmPWOWy1RgQwpvfpg52Bvyoh5RMHqlZ1d6n7eJlQcMFoi8WRutHcFKt/+I6
         WyZTVS/euR4HIApZ9QXyBvz4yVbT+VOPeOVXyxm6nEGCJXsPPMMCEsNDGhjpRE8+0MKg
         8r0DNrv9lpnAT8mAeYRy4ZeY45PSLGxVJqJNIIo7l7cTIruCcq3TqqHSjUa17Flh920M
         TM4bbya4Tcc4u56ne6AlrimKP5ODynswXiYvQaH9YPC8oXA7SsH9L0L9szkWcURzeIjx
         syeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746342; x=1796351142;
        h=content-type:mime-version:message-id:subject:cc:to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BOL0EtHUX3uQCewXy+MZOW361SXm/+7BiPOyQwwic7Q=;
        b=dAvfcVNZNEudA4iVeBUeFq4rw4MOAJf5fiURwVvxqBqK4XKpQcjnTcPTrRiQaUyvX2
         U6Xg40WZjY5CQiI+y+APKELawEI4OSKOO912F1s8SzCOvFa7wiEKn0Uq8MPSKQq9VFGi
         jdYhqw2dy30yabC8/5uddkKz6gZhKCiTGBMNALAvzMH33kOGkIIXobXyx/80vL84fMse
         2AXln7AgGRSrGc1Axo2dF3OZEBUSEwvrm3kpnHyg+V6vxpGVe6/fUWM4UJT7utjqGlrI
         6E/QlT4JJzwu1l0Qy/yuQCmLfNTl5rA0XTVV1Q3DtHWZNSWmBn7Ffm6C7zE7MVv2sWur
         +HVA==
X-Gm-Message-State: APuU4Z9gEG2qRGjXkZYgiEvUn31UUUvWCsvX8PlGdvI8aUDxhg1+uLQv
	4Mj67MOm+bVQvC0eGJFFmR4eUCfPBc3ZfUTIUZJalD1HImJMwSqRaCz/s+1Q1A==
X-Gm-Gg: AZFdTZfIrSqwRDDExvFB+6uleRRJxiFOFFwptjs3241Wx0EZMmEgk68cOI4ADX5OqQ0
	wakrd38ga08rmS22zux5PyV5gWe5QlJxvAmmcs11oF65tj36SUTLaQDXF0YYEXW+NulKX/adWtT
	kKldVeJ4uz6i+vTdZxGF7nsBNhwkiaKiJof53XdLgfetwqKJPVs+O5Pria+ypRi7QzvDYu7y8F9
	+NpbACBDUvoHZHHT715Sem926zMaAztGTwPm6g41RWZnJRxIufHt6D0o9hq3OcVSnlkA2h2Qpe7
	C4gbS0Dg5caC2T5yl8Zg7h5/9a1TL6bO0z2k3aPpLhMlyHmTq2Q7zjfsjVl2UO8RJqqaMh6h/V6
	qNifOkRZNJ0nD0Q3R+t0X4bHqYM/uaUbB1pcbhR5R8B/JSuOOkttO9uNNxR4dXyJpBAk+bLi6C5
	4PlXCAMwUFa5JpBOlp1vVvtkjZ8p4vTKfR/8iL0SdZoR7lKOaeZEoXbJwG/mES8eIW6wms6Bc+/
	xH1rAkueyBbY+9Bd7HIU5K0YHGdzNs2JPvLmhw+GXuxPUVxpKSiTcxLI3RdEPixF2UXYsTt4dTz
	WT1asywUEWSpig4qr7NItcsvse6tbQ==
X-Received: by 2002:a05:7301:4d0c:b0:376:a6d7:8f6f with SMTP id 5a478bee46e88-3856ec3ec8bmr24320989eec.17.1795746342343;
        Thu, 26 Nov 2026 18:25:42 -0800 (PST)
Received: from wg-vpn-sf2 ([138.197.218.192])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm52378669c88.1.2026.11.26.18.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:25:41 -0800 (PST)
From: Vincent Li <vincent.mc.li@gmail.com>
X-Google-Original-From: Vincent Li <root@gmail.com>
Date: Fri, 27 Nov 2026 02:25:40 +0000 (UTC)
To: loongarch@lists.linux.dev
cc: yangtiezhu@loongson.cn, hengqi.chen@gmail.com, chenhuacai@loongson.cn
Subject: Teaching LoongArch BPF to Fail Any Kernel Function
Message-ID: <c5f9ff8-ecec-e033-a1d8-4fb53392c41f@gmail.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII


Hi Loongarch Folks,

FYI, this feature seems cool to have for loongarch.
https://lore.kernel.org/bpf/20261114051805.683966-1-alexei.starovoitov@gmail.com/

I asked AI to write a blog about it 
https://loongfire.cn/2026-11-27-bpf-fmodret-scan.html?lang=zh

I might try this new feature on loongfire x86_64 first once it is mature 
:)

Best,

Vincent
