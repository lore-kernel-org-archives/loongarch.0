Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974723D83
	for <loongarch@lists.linux.dev>; Thu, 30 Jun 2022 14:06:25 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id cv13so18868856pjb.4
        for <loongarch@lists.linux.dev>; Thu, 30 Jun 2022 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :from:subject:content-transfer-encoding;
        bh=wLqBzcUifmh3gBEe8CEummUFK9VmCdUDMqe11T20KsQ=;
        b=Jhc9AarAoUDA4qAbziYUpZysg95tzeAC4p6s0O2p+N0ttInQqQxp3ghT7la9Ehz1IT
         qpeAYZ9m8ZRQY3R0dLOw0xHwWspQfk7eiy7bnSiQBNgjaPbLIpfP9R5bs6rhpqqgMvRm
         g8LDF4MxRBP3XI7dXIC8fXTsyaLTHsra5/HqZT30FWnb4JmNBLGqtGPk9boIlZ1xEWhk
         l8fWW1TYqjWRKVsqJJI71DkxZkCu69TuOlD1dm1Cc0Vk+deRoAhVuRFCHDDENR7NnmsH
         tBTbFrrvyx+Kxh8IREvbjNqT6+d2vtjqObIFMIfrGi75m8CD+aBv54yYqhemJ3FLfCvs
         qEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=wLqBzcUifmh3gBEe8CEummUFK9VmCdUDMqe11T20KsQ=;
        b=U0XfadDa9Dn95PAJYjvMiJnTBnYuln4+GpL8TykoFT1trGl5qE0T8yWcFBN1agSTFk
         QDroODXLeAHEFN/NEjuSOciCv1EWSKvaBZfyU1CfoTr3cOQYWcKrCV9eD4Z5VmpGb/HS
         uE1NYj1DQMVqtkIArADLCcCHe5bXYGsMtmPAy2tem+bxQTHZjHlUqXjkUftIgA7qtbQ8
         weEGDkt0hMhh6ktStJEefPlh3xKdITq0L1O+rlsTfoSE70zVxWee3HnyRNB9B4frtPD3
         taV30eCcnrMI81psjClxS+gWS0pk0K5MCt0lMKIcefoZYTzNQlgpAmSWjkHa9aKkC68h
         6ORA==
X-Gm-Message-State: AJIora/omnhdhGEuXKgdMj3k5zktAHgNBd59mV4wK3dUEfcCm7oWgxTo
	1/JlSqm69QTTDZ5iogrMRIyf36Xj+7o=
X-Google-Smtp-Source: AGRyM1szvNUIMb6trBNxwhdTqF75WNZMFS+I83tOx4DU9k+1OzzOii2WPlWon+DhMXTe+c9D0UZZjw==
X-Received: by 2002:a17:90a:f288:b0:1ec:7f71:b05f with SMTP id fs8-20020a17090af28800b001ec7f71b05fmr12232138pjb.184.1656597984654;
        Thu, 30 Jun 2022 07:06:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e7-20020a170902784700b0015eab1b097dsm13544343pln.22.2022.06.30.07.06.22
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 07:06:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f83d6a9d-ec07-21d1-87e3-700475192694@roeck-us.net>
Date: Thu, 30 Jun 2022 07:06:21 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: loongarch@lists.linux.dev
From: Guenter Roeck <linux@roeck-us.net>
Subject: Building loongarch64 toolchain
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I have been trying to build a toolchain for loongarch64 using gcc 12.1.0 and
binutils 2.38. Unfortunately, the resulting toolchain doesn't work for me.
Tracking down the problem, it turns out that gcc passes -mabi=lp64d to the
assembler, but the assembler only supports -mabi=lp64.

Where can I find guidance on how to build a working toolchain ? Using the
available toolchain binaries is not an option.

Thanks,
Guenter
