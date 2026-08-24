Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F312F8E95
	for <loongarch@lists.linux.dev>; Mon, 24 Aug 2026 03:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787541313; cv=none; b=PijjE7SjnJf6/66XGUDdeyOTxlLNtZFUMn8sbXCsc0CY8G5RrCMZCpA2qU+o1BmmFxYc/mIoaoJKaxRfN6kyKw3rm1Ob/6uVz2DHM0YF56TMNjMxHK8HdqMKmGNeYAGqDt+dHN3THHjV/69dL0THAhPYmjXNs++Y4mmYcXfeuTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787541313; c=relaxed/simple;
	bh=bUBx9kep0c8rrFUZFSUhdpaCpY4MKOUpnISPnWGkdqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c2nJ/4g7oJUz2ve/fsVKXgVER6FHSIAk8K0SqOufiO+IAuPmiBYtHds0zFvOMk18cSY6vCW+560SvV46FEvr6+xIo0mYFtoMSoagqW/az93TzpuH03UuZfWdZIqcYbjQ8yK2zW6aN3j6XbB9OBXRrGzAq2egxOKhC31j2guiHpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=mlSImj7e; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="mlSImj7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1787541283;
	bh=ei39FOg6slhKhmlpXJOSXnadnaEJRs2+EIDQ/kn99vw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=mlSImj7eANpAIl+PZPhXgl9jzDar9T+KTY+q1k0gM1ywAIgWVOxBNLGHES858+FHR
	 tL2/SE9/X5ULD/QPS1biHqGtbjqi9TRECqxtAqMqlSO7uZJNpayff6M1kqS0am0Z81
	 SDCJKjR4l2W4gmZfUxf6U2LhZQ1AKJLrhfCW8pxo=
X-QQ-mid: esmtpgz14t1787541275t59947f3e
X-QQ-Originating-IP: eNkY8xE37UYiU+/GzfAo2Sg0aAF8ViH9t1KHy0KUPGY=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 24 Aug 2026 11:14:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2083949217351599276
From: Wentao Guan <guanwentao@uniontech.com>
To: jeremy.jean@oss.cyber.gouv.fr
Cc: chenhuacai@kernel.org,
	kernel@xen0n.name,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH] LoongArch: kprobes: Avoid preempt count underflow without probe
Date: Mon, 24 Aug 2026 11:14:32 +0800
Message-Id: <20260824031432.3735027-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260823211822.2181816-2-Jeremy.Jean@oss.cyber.gouv.fr>
References: <20260823211822.2181816-2-Jeremy.Jean@oss.cyber.gouv.fr>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: McoPngcDBvM5YLWTAaMggZc2oD+QhEk5T7oRXhydRBJhZ66aHHwO7rEG
	nf+HkRj9KDe6ZJ3cEpACeNi0mh45ofWqWoVRk4m20gCyKB3aGzGC9+wjFmCOkR0JiJrNX3P
	wrf1EoR0mhuB1N8Ez4YKrUVYlxNNg7dV3IAFA12HbsQ6eWkLVVJJaC8eyYwxxD3TKbjwQsS
	3neGsqUqrYVl+fkidWYyB5o5GviNGvadKiarm4h0u6bU+HlSX0bTIzO8GlMDrcIE3ii+jrS
	MbD0J8345HqaS2UhMlkJQ2m7eDJ8ViFOnanQkWCHY62PIUKCNpeq2pKEXgW3J16rI2K9ABP
	kBeckiP1flqK3iF5YiUdC6TtyNztFCOQ4/pY8aGxRaNllRTu6TC+wW3+Fu/87N2++1rC6Ed
	1EB5Ka2cz6chKIKz9AnheP8PmRC33U8na6Ze3rjHsTTUde2iaVgYP4ZcmHUFpeHZVd1SCPt
	ugOBti+AxtCV1CyoGO1ROEJppRbLQ+IbAPJ0JQzu5MWVRGMlgY3vj/HW3rXQJStaJKp9Gba
	hWDvQxAiZNj8ZsI5IcckiGmTS4tYX5rLrhYae5cCsdbDdFI5pJbuMmN5a0NJM0IFtccl+iT
	ZbrI+Kg2CgJb6ZPR3zAeLSUwRQOeIf4Mofwa/DQPXho82QK3UnK/9JNww0SbFGLqg6qikN8
	RBm15j+b6/lVw+mS3fW/8u+UGep4WIbXsxcmvDV0nc85wEDglcIBpykQQAU1FnQTu8plsTD
	YiCq22ra51DoDpcrQ1GufDhi/0Fk/vfmOHJNuAyKrPhbDv7/NEnniPZ4bu95TdKW2fwRu0u
	ZUHeIxqjLVaKIRYu9hlV1eXpdLBXeK6PZaFDi/PVKNXCm9p8N6iU6XoPEdEiY3yAPi6XzwR
	OAFkaYaxawAU2plUmOVAy3RaufZPSYDufSR5TQiPWQnoXc+Jkn6lNQdTHCrQ09bhTD5PAaa
	GbsmDMt5T2wjAm7kh5u4iKNV1XR4+vSUBk7//uWGtL0FduKl3Ek9HJ+yCge5IF9yPmhxC1V
	L+f8nYimGmKJzA4r2HGkAkiUoP3OoMI9Yzr0MLmQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

Hello,

> @@ -275,6 +275,9 @@ bool kprobe_singlestep_handler(struct pt_regs *regs)
>  	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
>  	unsigned long addr = instruction_pointer(regs);
>  
> +	if (!cur)
> +		return false;
> +
This patch looks good to me.

BRs
Wentao Guan
