Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198B1136B
	for <loongarch@lists.linux.dev>; Wed,  5 Oct 2022 11:43:41 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id n40-20020a05600c3ba800b003b49aefc35fso848105wms.5
        for <loongarch@lists.linux.dev>; Wed, 05 Oct 2022 04:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I6JO1askOXv3fIRom3nLLKljILvMiIWCZXOL0gCR+zI=;
        b=Wc8WRlG+WpW8mbJvGsJThiHj1HY0CcYuGKBnatg6+VXXQi3avdhmYgTfOe3XPQAcY7
         I/JLrMiFquIOHeVyojQCB7iwK71vi1HkS7r2JM46K/HiaK0rYukCIhxzlO4R5sb0j/NB
         cAQ1owdKdxK3SaU4jfpOkhuphZUT1GwKDK+j7jou0ujCPuSoxkr6wKBAak22bMFVHydB
         asvpTNDz5gNPWcXeELDQV2bhdW3+FfJzQqOS+lLyu5Tp6+w0ne0v5XK0iipYT9cLSutr
         xtAN7myNx3rNfc3gEK9iOWxyQjAoT2zw2XL661qkxCw8sFgab0k0FrBsgtbBQOTi4oh9
         iC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I6JO1askOXv3fIRom3nLLKljILvMiIWCZXOL0gCR+zI=;
        b=4fpbL7EfCYN1yUDLxlsfINYNG+LBNRD8Q30LyORTgfXHCiJ/H/g9jq/5w0C1p1IAzv
         Qjsk+NaJuiWD/zUUzza5QlZJ1RHib1qSkUgDAmYP7g7uR0s/J7Nd48mERGZXVVLRzRVv
         6/l5mt+5QWLCsKHC+AW9nPe1rKhCnuEpEfS7RwVRcWGSiyxtTybQEgJf4T2v0gSHF2T7
         bF2u8nKMh0dvZOYJvoPvgY0eeZ0UpuRXsPAeAUqgVJTcuKIyyp9epeTz57hFMynQXHo3
         Wa6aY6BFqyMZo9Y+Twa1AcLqSXFmKrpMde2YWtDyymyhC8VF83OfbLh25OZAmEA/mchq
         5YsQ==
X-Gm-Message-State: ACrzQf019GxCWUcuwx6OJ3aBgyKzAS5D4/73Ef7i/UlSWPCWiVCP7us2
	Ey/wqmfKAR2q6nTxd+N76Uw=
X-Google-Smtp-Source: AMsMyM6kySg7JhOnbqTNzF3k0OyNUxybSz4HxCID9n6Z9GWv0v0/EuIV6zyBPaOH+zhl/XtyQ8wAPQ==
X-Received: by 2002:a05:600c:1c84:b0:3b3:ef37:afd3 with SMTP id k4-20020a05600c1c8400b003b3ef37afd3mr2874007wms.155.1664970220260;
        Wed, 05 Oct 2022 04:43:40 -0700 (PDT)
Received: from debian (host-78-150-37-98.as13285.net. [78.150.37.98])
        by smtp.gmail.com with ESMTPSA id z12-20020a05600c220c00b003a63a3b55c3sm1631689wml.14.2022.10.05.04.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 04:43:39 -0700 (PDT)
Date: Wed, 5 Oct 2022 12:43:38 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: build failure of next-20221005 due to 4078ec1ef5ed ("LoongArch: Use
 TLB for ioremap()")
Message-ID: <Yz1t6rPLOzKT8Id+@debian>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

The builds of loongarch allmodconfig have failed to build next-20221005
with errors

sound/soc/mediatek/common/mtk-btcvsd.c: In function 'mtk_btcvsd_snd_remove':
sound/soc/mediatek/common/mtk-btcvsd.c:1394:32: error: unused variable 'btcvsd' [-Werror=unused-variable]
 1394 |         struct mtk_btcvsd_snd *btcvsd = dev_get_drvdata(&pdev->dev);
      |                                ^~~~~~


sound/soc/sof/intel/hda.c: In function 'hda_dsp_remove':
sound/soc/sof/intel/hda.c:1185:26: error: unused variable 'bus' [-Werror=unused-variable]
 1185 |         struct hdac_bus *bus = sof_to_bus(sdev);
      |                          ^~~


drivers/mfd/asic3.c: In function 'asic3_mfd_remove':
drivers/mfd/asic3.c:940:23: error: unused variable 'asic' [-Werror=unused-variable]
  940 |         struct asic3 *asic = platform_get_drvdata(pdev);
      |                       ^~~~


drivers/gpu/drm/exynos/exynos7_drm_decon.c: In function 'decon_remove':
drivers/gpu/drm/exynos/exynos7_drm_decon.c:771:31: error: unused variable 'ctx' [-Werror=unused-variable]
  771 |         struct decon_context *ctx = dev_get_drvdata(&pdev->dev);
      |               


git bisect pointed to 4078ec1ef5ed ("LoongArch: Use TLB for ioremap()")

I will be happy to test any patch or provide any extra log if needed.


-- 
Regards
Sudip
